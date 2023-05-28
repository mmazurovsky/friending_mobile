import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_models.dart';
import '../repo/profile_repo.dart';

@lazySingleton
class ProfileContentManager with ChangeNotifier {
  final ProfileRepo _profileRepo;

  ProfileContentManager(this._profileRepo);

  late FullReadUserModel _profile;
  FullReadUserModel get profile => _profile;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void loadProfile() async {
    _isLoading = true;
    final profileRaw =
        await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
    profileRaw.fold((l) => null, (r) => _profile = r!);
    _isLoading = false;
    notifyListeners();
  }
}
