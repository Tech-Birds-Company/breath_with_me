import 'dart:async';

import 'package:breathe_with_me/managers/user_manager/auth_result.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final class FirebaseUserManager implements UserManager {
  late final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get userStream =>
      _firebaseAuth.userChanges().asBroadcastStream().distinct();

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

    return authResult.user;
  }

  @override
  Future<AuthResult> signUpWithEmail(
    String name,
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      await sendEmailVerification();

      return AuthResult(user: credential.user);
    } on FirebaseAuthException catch (error) {
      return AuthResult(errorMessage: error.message);
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  // TODO(musamuss): кажется что надо сделать приватным
  @override
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> sendResetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> updateAccountSettings(String name, String email) async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser?.updateDisplayName(name);
    await currentUser?.updateEmail(email);
  }
}
