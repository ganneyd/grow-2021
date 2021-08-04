import * as admin from "firebase-admin";

/**
 * @param {Record<string,unknown>} child,
 * @param {Record<string,unknown>} parent
 */
export async function signUpChild(
    child: Record<string, unknown>,
    parent: Record<string, unknown> ):Promise<Record<string, unknown>> {
      console.log('function patched thru calling signUpChild');
  // eslint-disable-next-line prefer-const
  let response = {
    success: false,
    user: " ",
    errorMsg: "",
  };
  try {
    const childUser = await admin.auth().createUser({
      email: child.email as string,
      password: child.password as string,

    });
    const result = await initParentAcc(
      parent.email as string, parent.password as string, childUser.uid);
    console.log(result);

    if (!(result["success"] as boolean)) {
      admin.auth().deleteUser(childUser.uid);
      if(result["errorMsg"] === ""){
        throw Error("Unable to authenticate Parental Account");
      }else{
        throw Error(result["errorMsg"] as string)
      }
      
    } else {
      await setChildCustomClaim(childUser, result["parentUID"] as string, child.schoolID as string);
      // by now everything should have completed successfully
      const childData = child.data as Record<string, unknown>;
      childData["parentID"] = result["parentUID"] as string;
      console.log("this is the childData: " + childData);
      await admin.firestore().collection("children")
          .doc(childUser.uid).set(childData);
      response["success"] = true;
      response["user"]= childUser.uid;
    }
  } catch (error) {
    response["errorMsg"] =error;
  }
  return response;
}
/**
* @param {admin.auth.UserRecord} user is the uid for the child user`
* @param {string} parentUID
* @param {string} schoolID 
* @return {void}
 */
async function setChildCustomClaim(
    user: admin.auth.UserRecord, parentUID: string, schoolID: string): Promise<void> {
  return admin.auth().setCustomUserClaims(user.uid, {
    child: true,
    parentID: parentUID,
    schoolID: schoolID

  });
}


/**
   * @param {string} email the  email belonging to the user`
   * @param {string} password the user's password`
   * @param {string} childUID
   * @return {string}
   */
async function initParentAcc(
    email: string, password: string, childUID: string ):
  Promise<Record<string, unknown>> {
  const result = {success: false,
    parentUID: "",
    errorMsg : ""};
  // attempt to get parent's acc if it exists
  await admin.auth().getUserByEmail(email).then(async (user)=>{
    // check to see if the user provided is actually a parent user
    if(user.customClaims && user.customClaims["parent"] as boolean) {
      //if it's actually a parent user then proceed
      //else set the err msg to reflect what happened
    
    await setParentClaims(user, childUID);
    result["success"]= true;
    result["parentUID"] =user.uid;
    }else{
      throw Error("User not authorized to create a child account, please use valid account. ");
    }
  }).catch( async (error)=>{
    console.log(error);
    result['errorMsg'] = error;
    await admin.auth().createUser({
      email,
      password,
    }).then(async (user)=>{
      await setParentClaims(user, childUID);
      result["success"]= true;
      result["parentUID"] =user.uid;
    }).catch((error)=>{
      result['errorMsg'] = error;
    });
  });
  return result;
}

/**
 *
 * @param {admin.auth.UserRecord} parentUser
 * @param {string} childUID
 */
async function setParentClaims(
    parentUser: admin.auth.UserRecord, childUID:string) :Promise<void> {
  const parentCustomClaims = parentUser.customClaims?? {};
  const children = parentCustomClaims["children"] as Array<string> ?? [];
  children.push(childUID);
  return admin.auth().setCustomUserClaims(parentUser.uid, {
    children: children,
    parent: true
  });
}
