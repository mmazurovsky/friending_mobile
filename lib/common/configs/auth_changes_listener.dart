import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../../screens/profile/repo/profile_repo.dart';
import '../auth/repo/auth_repo.dart';

abstract class AuthChangesListener {
  void call();
}

@LazySingleton(as: AuthChangesListener)
class AuthChangesListenerImpl implements AuthChangesListener {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  final CoordinatesRepo _coordinatesRepo;
  User? _localUser;

  AuthChangesListenerImpl(
    this._authRepo,
    this._profileRepo,
    this._coordinatesRepo,
  );

  @override
  void call() async {
    _authRepo.userStream.listen(
      (newUser) async {
        if (_localUser != newUser) {
          _localUser = newUser;
          if (newUser != null) {
            await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
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
}
