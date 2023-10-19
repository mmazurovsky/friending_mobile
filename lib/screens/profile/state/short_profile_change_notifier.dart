import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/profile_stream_service.dart';
import '../../../common/data/models/user_models.dart';

@lazySingleton
class ShortProfileChangeNotifier with ChangeNotifier {
  final ProfileStreamService _profileStreamService;

  ShortProfileChangeNotifier(
    this._profileStreamService,
  ) {
    _init();
  }

  ShortReadUserModel? user;

  StreamSubscription<ShortReadUserModel?>? _profileStreamSubscription;

  @override
  void dispose() {
    _profileStreamSubscription?.cancel();
    super.dispose();
  }

  void _init() {
    _profileStreamSubscription = _profileStreamService.profileStreamDependentOnAuth.listen((profile) {
      user = profile;
      notifyListeners();
    });
  }
}
