import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../../screens/profile/repo/profile_repo.dart';
import '../auth/repo/auth_repo.dart';
import '../data/models/user_models.dart';

@singleton
class ProfileStreamService implements Disposable {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;

  ProfileStreamService(this._authRepo, this._profileRepo) {
    _putEventsToProfileStreamController();
  }

  Stream<ShortReadUserModel?> get profileStreamDependentOnAuth => _profileStreamController.stream;
  StreamSubscription<ShortReadUserModel?>? _profileStreamSubscription;
  StreamSubscription<User?>? _userStreamSubscription;

  //TODO: not sure about stream type
  final _profileStreamController = StreamController<ShortReadUserModel?>.broadcast();

  void _putEventsToProfileStreamController() {
    final streamOfUserAuth = _authRepo.userStream;
    _userStreamSubscription = streamOfUserAuth.listen((user) {
      if (user == null) {
        _profileStreamSubscription?.cancel();
        _profileStreamController.sink.add(null);
      } else {
        _subscribeToProfileStream();
      }
    });
  }

  void _subscribeToProfileStream() {
    final streamOfProfile = _profileRepo.getProfileStreamForAuthenticatedUser();
    _profileStreamSubscription = streamOfProfile.listen((profile) {
      final currentUser = _authRepo.currentUser;
      if (currentUser != null && !currentUser.isAnonymous) {
        _profileStreamController.sink.add(profile);
      } else {
        _profileStreamController.sink.add(null);
      }
    });
  }

  @override
  FutureOr onDispose() {
    _profileStreamSubscription?.cancel();
    _userStreamSubscription?.cancel();
  }
}

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
