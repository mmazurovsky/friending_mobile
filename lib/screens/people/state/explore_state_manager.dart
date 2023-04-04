import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/entities/user_entities.dart';

@lazySingleton
class UserListNotifier with ChangeNotifier {
  final 
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ShortUserEntity> _nearbyUsers = [];
  List<ShortUserEntity> get nearbyUsers => _nearbyUsers;

  List<ShortUserEntity> _usersWithMostCommonTags = [];
  List<ShortUserEntity> get usersWithMostCommonTags =>
      _usersWithMostCommonTags;

  void fetchNearbyUsers() async {
    _isLoading = true;
    notifyListeners();

    _nearbyUsers = []; // replace with actual list of nearby users

    _isLoading = false;
    notifyListeners();
  }
}
