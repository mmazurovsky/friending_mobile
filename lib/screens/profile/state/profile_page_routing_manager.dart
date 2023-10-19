import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/auth_and_profile/profile_stream_service.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/auth_changes_listener.dart';
import '../../../common/data/models/user_models.dart';
import '../../auth/ui/sign_in_page.dart';
import '../ui/profile_editing_page.dart';
import '../ui/this_user_profile_page.dart';

@singleton
class ProfilePageRoutingManager with ChangeNotifier {
  final ProfileStreamService _profileStreamService;
  PageToShowForProfileTab _pageToShowForProfileTab = PageToShowForProfileTab.signIn;
  PageToShowForProfileTab get pageToShowForProfileTab => _pageToShowForProfileTab;
  ShortReadUserModel? _profile;

  ProfilePageRoutingManager(
    this._profileStreamService,
  ) {
    _init();
  }

  StreamSubscription<ShortReadUserModel?>? _profileStreamSubscription;

  void _init() {
    _profileStreamSubscription = _profileStreamService.profileStreamDependentOnAuth.listen((profile) {
      if (profile == null) {
        if (_pageToShowForProfileTab != PageToShowForProfileTab.signIn) {
          _profile = null;
          _pageToShowForProfileTab = PageToShowForProfileTab.signIn;
          notifyListeners();
        }
      } else if (profile.isEmptyProfile) {
        if (_pageToShowForProfileTab != PageToShowForProfileTab.profileEditing) {
          _profile = null;
          _pageToShowForProfileTab = PageToShowForProfileTab.profileEditing;
          notifyListeners();
        }
      } else {
        // if (_pageToShowForProfileTab != PageToShowForProfileTab.profile) {
          _profile = profile;
          _pageToShowForProfileTab = PageToShowForProfileTab.profile;
          notifyListeners();
        // }
      }
    });
  }

  @override
  void dispose() {
    _profileStreamSubscription?.cancel();
    super.dispose();
  }

  Widget get pageToShow {
    switch (_pageToShowForProfileTab) {
      case PageToShowForProfileTab.signIn:
        return const SignInPage();
      case PageToShowForProfileTab.profile:
        return ThisUserProfilePage(
          shortProfile: _profile!,
        );
      case PageToShowForProfileTab.profileEditing:
        return const ProfileEditingPage();
    }
  }
}

enum PageToShowForProfileTab {
  signIn,
  profile,
  profileEditing;
}
