import 'dart:async';

import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final class FirebaseUserManager implements UserManager {
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );
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
      }
    }

    // TODO(bestk1ngarthur): If first sign in -> update display name

    return null;
  }

  @override
  Future<User?> signInWithApple() async {
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);

    // TODO(bestk1ngarthur): If first sign in -> update display name

    return authResult.user;
  }

  @override
  Future<User?> signUpWithEmail(
    String name,
    String email,
    String password,
  ) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);
    await sendEmailVerification();

    return credential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }
}
