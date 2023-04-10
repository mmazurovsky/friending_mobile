import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/entities/user_entities.dart';
import '../../../common/data/failures/failures.dart';
import '../repo/coordinates_repo.dart';
import '../repo/user_list_repo.dart';

@lazySingleton
class ExploreStateManager with ChangeNotifier {
  final UserListRepo _userListRepo;
  final CoordinatesRepo _coordinatesRepo;

  ExploreStateManager(
    this._userListRepo,
    this._coordinatesRepo,
  );

  Failure? _failure;
  Failure? get failure => _failure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _maxDistanceInKm = 100;
  int get maxDistanceInKm => _maxDistanceInKm;

  List<ShortUserEntity> _nearbyUsers = [];
  List<ShortUserEntity> get nearbyUsers => _nearbyUsers;

  List<ShortUserEntity> _usersWithMostCommonTags = [];
  List<ShortUserEntity> get usersWithMostCommonTags => _usersWithMostCommonTags;

  void changeMaxDistanceInKm(int newMaxDistanceInKm) {
    _maxDistanceInKm = newMaxDistanceInKm;
    notifyListeners();
  }

  void fetchUsers() async {
    _isLoading = true;
    // notifyListeners();

    final nearbyUsersFuture = _userListRepo.getUsersNearby(
      maxDistanceInKm: _maxDistanceInKm,
    );

    final usersWithCommonTagsFuture =
        _userListRepo.getUsersWithMostCommonTags();

    //TODO: add error handling and displaying

    final nearbyUsers = await nearbyUsersFuture;
    final usersWithCommonTags = await usersWithCommonTagsFuture;

    nearbyUsers.fold((l) => _failure = l, (r) => _nearbyUsers = r);
    usersWithCommonTags.fold(
      (l) => _failure = l,
      (r) => _usersWithMostCommonTags = r,
    );

    //TODO: add code to show new registered users for guests without tags to operate

    _isLoading = false;
    notifyListeners();
    _failure = null;
  }
}
