import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../../screens/profile/repo/profile_repo.dart';
import 'auth_repo.dart';
import '../data/models/user_models.dart';

@singleton
class ActionsToAuthChangesService implements Disposable {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  final CoordinatesRepo _coordinatesRepo;
  User? _localUser;

  ActionsToAuthChangesService(
    this._authRepo,
    this._profileRepo,
    this._coordinatesRepo,
  ) {
    _listenToUserStreamAndPerformAuthActs();
  }

  StreamSubscription<User?>? _userStreamSubscription;

  void _listenToUserStreamAndPerformAuthActs() async {
    _userStreamSubscription = _authRepo.userStream.listen(
      (newUser) async {
        if (_localUser != newUser) {
          _localUser = newUser;
          if (newUser != null) {
            if (newUser.isAnonymous == false && newUser.email != null) {
              // user is signed in
              await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
            } else {
              //TODO: show screen to create profile
            }
          } else {
            // sign out performed
            _profileRepo.deleteProfileLocal();
            _coordinatesRepo.deleteLocalPositionFromLocal();
            _coordinatesRepo.addCurrentPositionToRemoteAndLocal();
          }
        } else {
          if (newUser == null) {
            // TODO: new user, need to try to sign in anonymously
            // TODO: but it makes impossible to sign in existing user that was signed out before
            // _authRepo.signInAnonymously();
          }
        }
      },
    );
  }

  @override
  FutureOr onDispose() {
    _userStreamSubscription?.cancel();
  }
}
