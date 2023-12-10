import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { AuthUserRecord } from "firebase-functions/lib/common/providers/identity";

admin.initializeApp();

const firestore = admin.firestore();
firestore.settings({ ignoreUndefinedProperties: true });

exports.updateUsersV2 = functions.auth
  .user()
  .beforeSignIn(async (user: AuthUserRecord) => {
    const usersRef = firestore.collection("users_v2");
    const userDoc = usersRef.doc(user.uid);

    try {
      await userDoc.set({
        uid: user.uid,
        disabled: user.disabled,
        displayName: user.displayName,
        email: user.email,
        emailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime,
        lastSignInTime: user.metadata.lastSignInTime,
        photoUrl: user.photoURL,
      });
    } catch (error) {
      console.error("Error checking/creating user in Firestore:", error);
    }
  });
