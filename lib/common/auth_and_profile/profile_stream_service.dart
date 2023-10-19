import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../screens/profile/repo/profile_repo.dart';
import '../data/models/user_models.dart';
import 'auth_repo.dart';

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