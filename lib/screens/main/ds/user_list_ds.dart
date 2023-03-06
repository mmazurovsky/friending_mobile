import 'dart:math' show cos, sqrt, asin;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../common/bag/bag.dart';
import '../../../common/client/compound_request_wrapper.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/entities/failures.dart';
import '../../../common/data/models/user_models.dart';

abstract class UserListDS {
  Future<Either<RequestFailure, Set<String>>> getUserIdsAroundPoint({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  });

  Future<Either<RequestFailure, List<FullUserModel>>> getUsersByIds({
    required Set<String> userIds,
    required String currentUserId,
  });

  Future<Map<String, int>> getUserIdsWithTheseTags({
    required List<String> tags,
  });
}

class UserListDSImpl implements UserListDS {
  final FirebaseFirestore _firestore;
  final CompoundRequestWrapper _compoundRequestWrapper;
  final RequestCheckWrapper _requestCheckWrapper;

  UserListDSImpl(
    this._firestore,
    this._compoundRequestWrapper,
    this._requestCheckWrapper,
  );

  String get userCollection => Bag.strings.server.userCollection;
  String get coordinatesCollection => Bag.strings.server.coordinatesCollection;
  String get tagsCollection => Bag.strings.server.tagsCollection;

  @override
  Future<Either<RequestFailure, Set<String>>> getUserIdsAroundPoint({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  }) async {
    // final now = DateTime.now();
    // const duration = Duration(hours: 4);
    // final startDateTime = now.subtract(duration);
    final future = _firestore
        .collection(coordinatesCollection)
        .where(
          'dateTime',
          isGreaterThan: startDateTime,
        )
        .get();

    final userCoordinates =
        await _requestCheckWrapper.requestToRemoteServer(future);

    final userIds = userCoordinates.map((r) {
      final userIds = r.docs
          .where((e) => _isInDistance(
                maxDistanceInKm: maxDistanceInKm,
                pointLat: pointLat,
                pointLong: pointLong,
                otherUserLat: e.get('lat'),
                otherUserLong: e.get('long'),
              ))
          .map((e) => e.get('userId') as String)
          .toSet();
      return userIds;
    });

    return userIds;
  }

  bool _isInDistance({
    required double pointLat,
    required double pointLong,
    required double otherUserLat,
    required double otherUserLong,
    required int maxDistanceInKm,
  }) {
    final distanceBetweenUsers = _distanceBetweenTwoPointsInKm(
      lat1: pointLat,
      lon1: pointLong,
      lat2: otherUserLat,
      lon2: otherUserLong,
    );
    return distanceBetweenUsers <= maxDistanceInKm;
  }

  double _distanceBetweenTwoPointsInKm({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const p = 0.017453292519943295; // Math.PI / 180
    const c = cos;
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // 2 * R; R = 6371 km
    final result = 12742 * asin(sqrt(a));
    return result;
  }

  @override
  Future<Either<RequestFailure, List<FullUserModel>>> getUsersByIds({
    required Set<String> userIds,
    required String currentUserId,
  }) async {
    final future = _firestore
        .collection(userCollection)
        .where(
          'id',
          whereIn: userIds,
        )
        .where(
          'id',
          isNotEqualTo: currentUserId,
        )
        .get();

    final users =
        _compoundRequestWrapper.wrapQuerySnapshotMap<FullUserModel>(future);

    return users;
  }

  @override
  Future<Map<String, int>> getUserIdsWithTheseTags(
      {required List<String> tags}) async {
    final userIdToTagsInCommon = <String, int>{};
    for (final element in tags) {
      final future = _firestore
          .collection(tagsCollection)
          .doc(element)
          .collection('usersWithThisTag')
          .get();
      final a = await _requestCheckWrapper.requestToRemoteServer(future);
      final b = a.map((r) => r.docs.map((e) => e.id).toList());
      final userIds = b.getOrElse(() => <String>[]);
      for (var element in userIds) {
        if (userIdToTagsInCommon.containsKey(element)) {
          userIdToTagsInCommon[element] = userIdToTagsInCommon[element]! + 1;
        } else {
          userIdToTagsInCommon[element] = 1;
        }
      }
    }

    return userIdToTagsInCommon;
  }
}
