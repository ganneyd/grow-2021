import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as childFuncs from "./child/sign_up_child";
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp(functions.config().firebase);


export const signUpUser = functions.https.onCall(async (data)=>{
  if (data.dependent["user_type"] as string === "child" &&
  data.dependency["user_type"] as string === "parent") {
    return await childFuncs.signUpChild(
      data.dependent as Record<string, unknown>,
      data.dependency as Record<string, unknown>);
  }
  return {
    success: false,
    childUID: "",
    errorMsg: "Unexpected error, sign up not done by authorized personnel",
  };
});
// clears the child references from the parent's custom claims
export const clearChildRefs =
functions.auth.user().onDelete(async (user)=>{
  const claims = user.customClaims as Record<string, unknown>;
  const parentRecord =
  await admin.auth().getUser(claims["parentUID"] as string);
  const parentClaims = parentRecord.customClaims as Record<string, unknown>;
  const children = parentClaims["children"] as Array<string>;
  children.splice(children.indexOf(user.uid), 1);
  parentClaims["children"] = children;
  await admin.auth().setCustomUserClaims(parentRecord.uid, parentClaims);
  console.log(parentClaims);
  console.log(claims["parentUID"] as string );
});
