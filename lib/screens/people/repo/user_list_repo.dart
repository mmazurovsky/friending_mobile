import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/entities/user_entities.dart';
import '../../../common/data/failures/failures.dart';
import '../../profile/repo/profile_repo.dart';
import '../ds/user_list_ds.dart';
import 'coordinates_repo.dart';

abstract class UserListRepo {
  Future<Either<Failure, List<ShortUserEntity>>> getUsersNearby({
    required int maxDistanceInKm,
  });

  Future<Either<RequestFailure, List<ShortUserEntity>>>
      getUsersWithMostCommonTags();
}

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
  Future<Either<Failure, List<ShortUserEntity>>> getUsersNearby({
    required int maxDistanceInKm,
  }) async {
    // get users last location from storage
    final latestPoint = _coordinatesRepo.getLatestPosition();

    if (latestPoint == null) {
      return left(
        CacheFailure(
          m: Strings.failures.cacheFailure.copyWith(
            forUser: 'Can not get your latest point',
          ),
          e: Exception('Latest point is not available'),
        ),
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

      final result = userIds.fold(
        (l) async {
          return left<RequestFailure, List<ShortUserEntity>>(l);
        },
        (r) async {
          final users = await _userListDS.getUsersByIds(userIds: r);
          return users;
        },
      );

      return result;
    }
  }

  @override
  Future<Either<RequestFailure, List<ShortUserEntity>>>
      getUsersWithMostCommonTags() async {
    // get tags of current user
    final tags = _profileRepo.getProfileLocal()?.shortUserModel.tags;
    if (tags == null) {
      return left(
        AuthFailure(
          m: Strings.failures.authFaliure.copyWith(
            forUser: 'Can not get your interests',
          ),
          e: Exception('User tags are not available'),
        ),
      );
    }

    final userIds = await _userListDS.getUserIdsWithTheseTags(tags: tags);

    if (userIds.isEmpty) {
      return right([]);
    } else {
      // sort userids by map value decending and take top 10 keys and put these keys in separate list
      final sortedUserIds = userIds.entries
          .toList()
          .sorted((a, b) => b.value.compareTo(a.value))
          .take(10)
          .map((e) => e.key)
          .toSet();

      final users = await _userListDS.getUsersByIds(userIds: sortedUserIds);

      return users;
    }
  }
}
