import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/data/models/user_models.dart';
import '../repo/profile_repo.dart';

@injectable
class ProfileContentManager with ChangeNotifier {
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;

  ProfileContentManager(
    this._profileRepo,
    this._authRepo,
  );

  late FullReadUserModel _profile;
  FullReadUserModel get profile => _profile;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void loadProfile() async {
    _isLoading = true;
    FullReadUserModel? fetchedProfile;
    try {
      fetchedProfile =
          await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
    } on Exception catch (e) {
      //TODO
      print(e);
    }
    if (fetchedProfile != null) {
      _profile = fetchedProfile;
      _isLoading = false;
    } else {
      await _authRepo.signOut();
    }
    notifyListeners();
  }

  void signOut() async {
    await _authRepo.signOut();
  }
}
