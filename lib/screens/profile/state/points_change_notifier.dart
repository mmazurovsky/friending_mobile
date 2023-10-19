import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/auth_repo.dart';
import '../repo/profile_repo.dart';

@lazySingleton
class PointsChangeNotifier with ChangeNotifier {
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;

  PointsChangeNotifier(
    AuthRepo authRepo,
    ProfileRepo profileRepo,
  )   : _authRepo = authRepo,
        _profileRepo = profileRepo {
    _init();
  }

  int pointsCount = 0;

  StreamSubscription<int>? _pointsStreamSubscription;
  StreamSubscription<User?>? _userStreamSubscription;

  @override
  void dispose() {
    _pointsStreamSubscription?.cancel();
    _userStreamSubscription?.cancel();
    super.dispose();
  }

  void _init() {
    _userStreamSubscription = _authRepo.userStream.listen(
      (event) {
        if (event == null) {
          pointsCount = 0;
          notifyListeners();
          _pointsStreamSubscription?.cancel();
        } else {
          _pointsStreamSubscription = _profileRepo.getPointsStream()?.listen(
            (event) {
              pointsCount = event;
              notifyListeners();
            },
          );
        }
      },
    );
  }
}
