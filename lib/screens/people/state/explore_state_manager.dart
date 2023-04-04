import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/entities/user_entities.dart';
import '../repo/coordinates_repo.dart';
import '../repo/user_list_repo.dart';

@lazySingleton
class UserListNotifier with ChangeNotifier {
  final UserListRepo _userListRepo;
  final CoordinatesRepo _coordinatesRepo;

  bool _isLoading = false;

  UserListNotifier(
    this._userListRepo,
    this._coordinatesRepo,
  );
  bool get isLoading => _isLoading;

  List<ShortUserEntity> _nearbyUsers = [];
  List<ShortUserEntity> get nearbyUsers => _nearbyUsers;

  List<ShortUserEntity> _usersWithMostCommonTags = [];
  List<ShortUserEntity> get usersWithMostCommonTags => _usersWithMostCommonTags;

  Future<void> addCurrentPosition() async {
    final result = await _coordinatesRepo.addCurrentPosition();
  }

  void fetchUsers({required int maxDistanceInKm}) async {
    _isLoading = true;
    notifyListeners();

    final nearbyUsers = _userListRepo.getUsersNearby(
      maxDistanceInKm: maxDistanceInKm,
    );

    final usersWithCommonTags = _userListRepo.getUsersWithMostCommonTags();

    //TODO: add error handling and displaying
    //TODO: add code to show new registered users for guests without tags to operate

    _isLoading = false;
    notifyListeners();
  }
}
