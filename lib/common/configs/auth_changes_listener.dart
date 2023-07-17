import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../../screens/profile/repo/profile_repo.dart';
import '../auth/repo/auth_repo.dart';
import '../data/models/user_models.dart';

@singleton
class AuthChangesListenerImpl implements Disposable {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  final CoordinatesRepo _coordinatesRepo;
  User? _localUser;

  AuthChangesListenerImpl(
    this._authRepo,
    this._profileRepo,
    this._coordinatesRepo,
  ) {
    _init();
    _putEventsToProfileStreamController();
  }

  void _init() async {
    _authRepo.userStream.listen(
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
            _coordinatesRepo.deleteLocalPosition();
          }
        } else {
          if (newUser == null) {
            // new user, need to anonymously sign in
            _authRepo.signInAnonymously();
          }
        }
      },
    );
  }

  Stream<ShortReadUserModel?> get profileStreamDependentOnAuth =>
      _streamController.stream;
  StreamSubscription<ShortReadUserModel?>? _profileStreamSubscription;

  //TODO: not sure about stream type
  final _streamController = StreamController<ShortReadUserModel?>();

  void _putEventsToProfileStreamController() {
    final streamOfUserAuth = _authRepo.userStream;
    streamOfUserAuth.doOnData((user) {
      if (user == null) {
        _profileStreamSubscription?.cancel();
        _streamController.sink.add(null);
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
        _streamController.sink.add(profile);
      } else {
        _streamController.sink.add(null);
      }
    });
  }

  @override
  FutureOr onDispose() {
    _streamController.close();
    _profileStreamSubscription?.cancel();
  }
}
