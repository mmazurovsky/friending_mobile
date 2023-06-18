import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/entities/user_entities.dart';
import '../../../common/data/failures/failures.dart';
import '../../profile/repo/profile_repo.dart';
import '../ds/user_list_ds.dart';
import 'coordinates_repo.dart';

abstract class UserListRepo {
  Future<List<ShortReadUserEntity>> getUsersNearby({
    required int maxDistanceInKm,
  });

  Future<List<ShortReadUserEntity>> getUsersWithMostCommonTags();
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
  Future<List<ShortReadUserEntity>> getUsersNearby({
    required int maxDistanceInKm,
  }) async {
    // get users last location from storage
    final latestPoint = _coordinatesRepo.getLatestPosition();

    if (latestPoint == null) {
      throw CacheFailure(
        m: Strings.failures.cacheFailure.copyWith(
          forUser: 'Enable location services to see users nearby',
        ),
        e: Exception('Latest point is not available'),
      );
    } else {
      // check if there are location permissions if not return failure
      final startDateTime = DateTime.now().subtract(const Duration(days: 2));
      final userIds = await _userListDS.getUserIdsAroundPoint(
        pointLat: latestPoint.lat,
        pointLong: latestPoint.long,
        maxDistanceInKm: maxDistanceInKm,
        startDateTime: startDateTime,
      );

      final users = await _userListDS.getUsersByIds(userIds: userIds);
      return users;
    }
  }

  @override
  Future<List<ShortReadUserEntity>> getUsersWithMostCommonTags() async {
    // get tags of current user
    final tags = _profileRepo.getShortProfileLocal()?.tags;
    if (tags == null || tags.isEmpty) {
      final freshUsers = await _userListDS.getFreshUsers(50);
      return freshUsers;
      // throw
      //   AuthFailure(
      //     m: Strings.failures.authFaliure.copyWith(
      //       forUser: 'Can not get your interests',
      //     ),
      //     e: Exception('User tags are not available'),
      //   ),
      // );
    }

    final userIds = await _userListDS.getUserIdsWithTheseTags(tags: tags);

    if (userIds.isEmpty) {
      return [];
    } else {
      // sort userids by map value decending and take top 10 keys and put these keys in separate list
      final sortedUserIds = userIds.entries
          .toList()
          .sorted((a, b) => b.value.compareTo(a.value))
          .take(50)
          .map((e) => e.key)
          .toSet();

      final users = await _userListDS.getUsersByIds(userIds: sortedUserIds);

      return users;
    }
  }
}
