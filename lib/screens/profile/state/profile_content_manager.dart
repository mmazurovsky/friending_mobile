import 'package:collection/collection.dart';
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
    try {
      _profile = (await _profileRepo.fetchProfileFromRemoteAndSaveLocally())!;
    } on Exception catch (e) {
      //TODO
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}
