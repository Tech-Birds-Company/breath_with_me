import 'dart:async';

import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:apple_sign_in/apple_sign_in.dart';

final class FirebaseUserManager extends UserManager {
  User? user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return userCredential.user;
      } else {
        print('Missing Google Auth Token');
        return null;
      }
    } else {
      print('Sign in aborted by user');
      return null;
    }
  }

  // Future<User?> signInWithApple() {
  //       final AuthorizationResult result = await AppleSignIn.performRequests(
  //       [AppleIdRequest(requestedScopes: scopes)]);
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       final appleIdCredential = result.credential;
  //       final oAuthProvider = OAuthProvider('apple.com');
  //       final credential = oAuthProvider.credential(
  //         idToken: String.fromCharCodes(appleIdCredential.identityToken),
  //         accessToken:
  //             String.fromCharCodes(appleIdCredential.authorizationCode),
  //       );

  //       final authResult = await _firebaseAuth.signInWithCredential(credential);
  //       final firebaseUser = authResult.user;
  //       if (scopes.contains(Scope.fullName)) {
  //         final String displayName =
  //             '${appleIdCredential.fullName.givenName} ${appleIdCredential.fullName.familyName}';
  //         await firebaseUser.updateProfile(displayName: displayName);
  //       }
  //       return _userFromFirebase(firebaseUser);
  //     case AuthorizationStatus.error:
  //       throw PlatformException(
  //         code: 'ERROR_AUTHORIZATION_DENIED',
  //         message: result.error.toString(),
  //       );
  //     case AuthorizationStatus.cancelled:
  //       throw PlatformException(
  //         code: 'ERROR_ABORTED_BY_USER',
  //         message: 'Sign in aborted by user',
  //       );
  //   }
  //   return null;
  // }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
