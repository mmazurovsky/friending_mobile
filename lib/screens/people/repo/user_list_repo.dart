import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../common/data/entities/user_entities.dart';
import '../../../common/data/failures/failures.dart';
import '../ds/user_list_ds.dart';

abstract class UserListRepo {
  Future<Either<RequestFailure, List<ShortUserEntity>>> getUsersNearby({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  });

  Future<Either<RequestFailure, List<ShortUserEntity>>>
      getUsersWithMostCommonTags({required Set<String> tags});
}

class UserListRepoImpl implements UserListRepo {
  final UserListDS _userListDS;

  UserListRepoImpl(this._userListDS);

  @override
  Future<Either<RequestFailure, List<ShortUserEntity>>> getUsersNearby({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
  }) async {
    final startDateTime = DateTime.now().subtract(const Duration(days: 2));
    final userIds = await _userListDS.getUserIdsAroundPoint(
      pointLat: pointLat,
      pointLong: pointLong,
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

  @override
  Future<Either<RequestFailure, List<ShortUserEntity>>>
      getUsersWithMostCommonTags({required Set<String> tags}) async {
    final userIds = await _userListDS.getUserIdsWithTheseTags(tags: []);

    if (userIds.isEmpty) {
      return right([]);
    } else {
      // sort userids by map value decending and take top 10 keys and put these keys in separate list
      final sortedUserIds = userIds.entries
          .toList()
          .sorted((a, b) => b.value.compareTo(a.value))
          .take(10)
          .map((e) => e.key)
          .toList();
    }

    final result = userIds.fold(
      (l) async {
        return left<RequestFailure, Set<ShortUserEntity>>(l);
      },
      (r) async {
        final users = await _userListDS.getUsersByIds(userIds: r);
        return users;
      },
    );
  }
}
