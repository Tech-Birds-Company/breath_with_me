import 'dart:async';

import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/managers/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:breathe_with_me/managers/user_manager/auth_result.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final class FirebaseUserManager implements UserManager {
  final PremiumManager _premiumManager;
  final DatabaseManager _databaseManager;
  final SharedPreferencesManager _sharedPreferencesManager;

  FirebaseUserManager(
    this._premiumManager,
    this._databaseManager,
    this._sharedPreferencesManager,
  );

  StreamSubscription<User?>? _userSubscription;
  late final _firebaseAuth = FirebaseAuth.instance;
  late final _userStream = _firebaseAuth.userChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<bool> get isUserPremium async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return _premiumManager.isUserPremium(user.uid);
    }
    return false;
  }

  @override
  Stream<User?> get userStream => _userStream;

  @override
  Stream<bool> get isPremiumUserStream {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return _premiumManager.isPremiumUserStream(user.uid);
    }
    return Stream.value(false);
  }

  void init() {
    _userSubscription ??= _userStream.listen(
      (user) async {
        if (user != null) {
          await FirebaseAnalytics.instance
              .setUserProperty(name: 'userId', value: user.uid);
          await Purchases.logIn(user.uid);
          await _premiumManager.initSubscriptions();
          return;
        }
        await FirebaseAnalytics.instance
            .setUserProperty(name: 'userId', value: null);
        await _sharedPreferencesManager.clear();
        await _databaseManager.clearDb();
      },
    );
  }

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
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        logger.e('Error sending password reset email: $e');
      }
    }
  }

  @override
  Future<void> resetPassword(String code, String password) async {
    await _firebaseAuth.confirmPasswordReset(
      code: code,
      newPassword: password,
    );
  }

  @override
  Future<void> updateAccountSettings(String name, String email) async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser?.updateDisplayName(name);
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
