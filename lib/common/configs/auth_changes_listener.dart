import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../screens/profile/repo/profile_repo.dart';
import '../auth/repo/auth_repo.dart';

abstract class AuthChangesListener {
  void call();
}

@LazySingleton(as: AuthChangesListener)
class AuthChangesListenerImpl implements AuthChangesListener {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  User? _localUser;

  AuthChangesListenerImpl(
    this._authRepo,
    this._profileRepo,
  );

  @override
  void call() async {
    _authRepo.userStream.listen(
      (newUser) async {
        if (_localUser != newUser) {
          _localUser = newUser;
          if (newUser != null) {
            //TODO:  get user from remote and update locally
          } else {
            // sign out performed
            _profileRepo.deleteProfileLocal();
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
