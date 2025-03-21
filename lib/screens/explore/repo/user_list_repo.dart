import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/point_model.dart';
import '../../../common/data/models/user_models.dart';
import '../../profile/repo/profile_repo.dart';
import '../ds/user_list_ds.dart';
import 'coordinates_repo.dart';

abstract class UserListRepo {
  Future<List<ShortReadUserModel>> getUsersNearby({
    required int maxDistanceInKm,
  });

  Future<List<ShortReadUserModel>> getRelevantUsers();
}

@LazySingleton(as: UserListRepo)
class UserListRepoImpl implements UserListRepo {
  final UserListDS _userListDS;
  final CoordinatesRepo _coordinatesRepo;
  final ProfileRepo _profileRepo;

  UserListRepoImpl(
    this._userListDS,
    this._coordinatesRepo,
    this._profileRepo,
  );

  @override
  Future<List<ShortReadUserModel>> getUsersNearby({
    required int maxDistanceInKm,
  }) async {
    // get users last location from storage
    PointModel? latestPoint = _coordinatesRepo.getLatestPositionFromLocal();

    if (latestPoint == null) {
      await _coordinatesRepo.addCurrentPositionToRemoteAndLocal();
      latestPoint = _coordinatesRepo.getLatestPositionFromLocal();
      // throw CacheFailure(
      //   m: Strings.failures.cacheFailure.copyWith(
      //     forUser: 'Enable location services to see users nearby',
      //   ),
      //   e: Exception('Latest point is not available'),
      // );
    }

    // check if there are location permissions if not return failure
    final startDateTime = DateTime.now().subtract(const Duration(days: 2));
    final userIds = await _userListDS.getUserIdsAroundPoint(
      pointLat: latestPoint!.lat,
      pointLong: latestPoint.long,
      maxDistanceInKm: maxDistanceInKm,
      startDateTime: startDateTime,
    );

    final users = await _userListDS.getUsersByIds(userIds: userIds);
    return users;
  }

  @override
  Future<List<ShortReadUserModel>> getRelevantUsers() async {
    // get tags of current user
    final tags = _profileRepo.getShortProfileLocal()?.tags;
    if (tags == null || tags.isEmpty) {
      return _getFreshUsers(50);
    } else {
      final usersWithMostCommonTags = await _getUsersWithMostCommonTags(tags);
      if (usersWithMostCommonTags.isEmpty) {
        return _getFreshUsers(50);
      } else {
        if (usersWithMostCommonTags.length < 50) {
          final freshUsers = await _getFreshUsers(50 - usersWithMostCommonTags.length);
          final freshUsersWihoutUsersWithMostCommonTags =
              freshUsers.where((element) => !usersWithMostCommonTags.map((e) => e.id).toList().contains(element.id));
          final usersToShow = List<ShortReadUserModel>.from(usersWithMostCommonTags)..addAll(freshUsersWihoutUsersWithMostCommonTags);
          return usersToShow;
        } else {
          return usersWithMostCommonTags;
        }
      }
    }
  }

  Future<List<ShortReadUserModel>> _getUsersWithMostCommonTags(List<String> tags) async {
    final userIds = await _userListDS.getUserIdsWithTheseTags(tags: tags);

    if (userIds.isEmpty) {
      return [];
    } else {
      // sort userids by map value decending and take top 10 keys and put these keys in separate list
      final sortedUserIds = userIds.entries.toList().sorted((a, b) => b.value.compareTo(a.value)).take(50).map((e) => e.key).toSet();

      final users = await _userListDS.getUsersByIds(userIds: sortedUserIds);

      return users;
    }
  }

  Future<List<ShortReadUserModel>> _getFreshUsers(int count) async {
    final freshUsers = await _userListDS.getFreshUsers(count);
    return freshUsers;
  }
}
