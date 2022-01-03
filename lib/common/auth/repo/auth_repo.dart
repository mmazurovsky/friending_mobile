import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter_mobile/common/constants/constants.dart';
import 'package:flutter_starter_mobile/common/data/data_converters.dart';
import 'package:flutter_starter_mobile/common/data/data_interfaces.dart';
import 'package:flutter_starter_mobile/common/data/extensions.dart';
import 'package:flutter_starter_mobile/common/data/user.dart';
import 'package:flutter_starter_mobile/common/exceptions/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class AuthRepo<T extends UserInterface> {
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> startSigningWithEmailAndLink({required String email});
  Future<void> endSigningWithEmailAndLink({required Uri link});
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
  Future<void> signOut();
  Future<void> deleteProfile();
  T? get currentUser;
  Stream<T?> get userStream;
  bool isSignInWithEmailLink(String link);
}

class FirebaseAuthRepoImpl<T extends UserInterface> implements AuthRepo<T> {
  final FirebaseAuth _firebaseAuth;
  String? _storedEmailForLinkVerification;
  String? phoneVerificationId;
  int? phoneForceResendingToken;

  FirebaseAuthRepoImpl(this._firebaseAuth);

  User? get _currentUserFirebase {
    final user = _firebaseAuth.currentUser;
    return user;
  }

  @override
  T? get currentUser {
    return _currentUserFirebase?.convertToUserInterface() as T?; // TODO test
  }

  @override
  Stream<T?> get userStream => _firebaseAuth
      .userChanges()
      .map((user) => user?.convertToUserInterface() as T?);

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> startSigningWithEmailAndLink({required String email}) async {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: GeneralConstants.dynamicLinkUrlPrefix,
      androidPackageName: GeneralConstants.androidPackageName,
      iOSBundleId: GeneralConstants.iosBundleId,
      handleCodeInApp: true,
      androidInstallApp: true,
    );

    await _firebaseAuth.sendSignInLinkToEmail(
        email: email, actionCodeSettings: actionCodeSettings);

    _storedEmailForLinkVerification = email;
  }

  @override
  Future<void> endSigningWithEmailAndLink({required Uri link}) async {
    if (_firebaseAuth.isSignInWithEmailLink(link.toString())) {
      final userCredentials = await _firebaseAuth.signInWithEmailLink(
          email: _storedEmailForLinkVerification!, emailLink: link.toString());
    } else {
      throw CustomAuthException(
          "Failure while ending signing with email and link");
    }
  }

  @override
  bool isSignInWithEmailLink(String link) {
    return _firebaseAuth.isSignInWithEmailLink(link);
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredentials =
        await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signInWithApple() async {
    /// Generates a cryptographically secure random nonce, to be included in a
    /// credential request.
    String generateNonce([int length = 32]) {
      const charset =
          '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
      final random = Random.secure();
      return List.generate(
          length, (_) => charset[random.nextInt(charset.length)]).join();
    }

    /// Returns the sha256 hash of [input] in hex notation.
    String sha256ofString(String input) {
      final bytes = utf8.encode(input);
      final digest = sha256.convert(bytes);
      return digest.toString();
    }

    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential =
        OAuthProvider(GeneralConstants.appleAuthProviderId).credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.

    final userCredential =
        await _firebaseAuth.signInWithCredential(oauthCredential);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> deleteProfile() async {
    await _currentUserFirebase?.delete();
  }
}
