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


export const signUpNewChildAcc = functions.https.onCall(async (data, context)=>{
  return await childFuncs.signUpChild(
    data.child as Record<string, unknown>,
    data.parent as Record<string, unknown>);
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
  console.log(claims["parentUID"] as string );
});
