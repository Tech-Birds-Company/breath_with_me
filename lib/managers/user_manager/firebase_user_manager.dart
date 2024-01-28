import 'dart:async';

import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/managers/user_manager/auth_result.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final class FirebaseUserManager implements UserManager {
  final SubscriptionsManager _subscriptionManager;
  final DatabaseManager _databaseManager;

  FirebaseUserManager(
    this._subscriptionManager,
    this._databaseManager,
  );

  StreamSubscription<User?>? _userSubscription;
  late final _firebaseAuth = FirebaseAuth.instance;
  late final _userStream = _firebaseAuth.userChanges();

  ActionCodeSettings get _actionCodeSettings => ActionCodeSettings(
        url: 'https://bwithmedev.firebaseapp.com',
        handleCodeInApp: true,
        iOSBundleId: 'com.dobry.breathewithme.develop',
        androidPackageName: 'com.dobry.breathewithme.develop',
        androidInstallApp: true,
        androidMinimumVersion: '1',
      );

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  void init() => _userSubscription ??= _userStream.listen(
        (user) async {
          if (user != null) {
            final loginResult = await _subscriptionManager.login(user.uid);
            logger.i(
              '[RevenueCat]: login ✅: ${loginResult.customerInfo.toJson()}',
            );
            return;
          }
          await _subscriptionManager.logOut();
          await _databaseManager.clearDb();
        },
      );

  @override
  Stream<User?> get userStream => _userStream;

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
      await _sendEmailVerification();

      return AuthResult(user: credential.user);
    } on FirebaseAuthException catch (error) {
      return AuthResult(errorMessage: error.message);
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  Future<void> sendResetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: _actionCodeSettings,
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        // TODO(musamuss): добавить обработку ошибок
        print(e.message);
      }
    }
  }

  @override
  Future<void> resetPassword(String code, String password) async {
    return await _firebaseAuth.confirmPasswordReset(
      code: code,
      newPassword: password,
    );
  }

  @override
  Future<void> updateAccountSettings(String name, String email) async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser?.updateDisplayName(name);
    await currentUser?.verifyBeforeUpdateEmail(email);
  }

  Future<void> _sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    _userSubscription = null;
  }
}
