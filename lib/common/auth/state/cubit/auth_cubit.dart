import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart';
import 'package:flutter_mobile_starter/common/client/network_check.dart';
import 'package:flutter_mobile_starter/common/data/data_interfaces.dart';
import 'package:flutter_mobile_starter/common/exceptions/custom_exceptions.dart';
import 'package:flutter_mobile_starter/common/utils/logging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit<T extends UserInterface> extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  final NetworkCheck _networkCheck;
  AuthCubit(this._authRepo, this._networkCheck)
      : super(const AuthState.initial()) {
    updateAuthStatus();
  }

  T? _currentUser;

  T? get currentUser => _currentUser;

  void _checkNetwork() {
    try {
      _networkCheck();
    } on CustomNoInternetException catch (e) {
      emit(AuthState.error(e.message));
    }
  }

  void updateAuthStatus() async {
    _checkNetwork();
    if (_authRepo.currentUser == null) {
      _currentUser = null;
      emit(const AuthState.unauthenticated());
    } else {
      // TODO test
      if (_currentUser?.name != null) {
        emit(AuthState.authenticatedWithProfile(_currentUser!));
      } else {
        emit(const AuthState.authenticatedWithoutProfile());
      }
    }
  }

  void startSigningWithEmailLink(String email) async {
    _checkNetwork();
    try {
      await _authRepo.startSigningWithEmailAndLink(email: email);
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error('Authentication error, try again'));
    }
  }

  void endSigningWithEmailLink(Uri link) async {
    _checkNetwork();
    try {
      await _authRepo.endSigningWithEmailAndLink(link: link);
      updateAuthStatus();
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error('Authentication error, try again'));
    }
  }

  void signInWithGoogle() async {
    _checkNetwork();
    try {
      await _authRepo.signInWithGoogle();
      updateAuthStatus();
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error('Authentication error, try again'));
    }
  }

  void signInWithApple() async {
    _checkNetwork();
    try {
      await _authRepo.signInWithApple();
      updateAuthStatus();
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error('Authentication error, try again'));
    }
  }

  void signOut() async {
    _checkNetwork();
    try {
      await _authRepo.signOut();
      updateAuthStatus();
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error('Sign out error, try again'));
    }
  }

  void deleteMyProfile() async {
    _checkNetwork();
    try {
      await _authRepo.deleteProfile();
      updateAuthStatus();
    } on FirebaseException catch (e) {
      logFunctionName();
      logger.severe(e.toString());
      emit(const AuthState.error(
          'Deletion error, please, sign out, sign in again and repeat'));
    }
  }
}
