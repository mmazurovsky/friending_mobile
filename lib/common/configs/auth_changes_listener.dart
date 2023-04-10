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
  User? localUser;

  AuthChangesListenerImpl(
    this._authRepo,
    this._profileRepo,
  );

  @override
  void call() async {
    _authRepo.userStream.listen(
      (newUser) async {
        if (localUser == newUser && localUser != null) {
          if (newUser != null) {
            //TODO:  get user from remote and update locally
          } else {
            _profileRepo.deleteProfileLocal();
          }
        }
      },
    );
  }
}
