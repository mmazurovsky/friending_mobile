import 'package:firebase_auth/firebase_auth.dart';

import '../../screens/profile/repo/profile_repo.dart';
import '../auth/repo/auth_repo.dart';

class AuthChangesListener {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  User? localUser;

  AuthChangesListener(
    this._authRepo,
    this._profileRepo,
  );

  void listenAndReact() async {
    _authRepo.userStream.listen(
      (newUser) async {
        if (localUser == newUser) {
          if (newUser != null) {
            // get user from remote and update locally
          } else {
            _profileRepo.deleteProfileLocal();
          }
        }
      },
    );
  }
}
