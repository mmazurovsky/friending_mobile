import 'dart:math' show cos, sqrt, asin;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../common/bag/bag.dart';
import '../../../common/data/entities/failures.dart';
import '../../../common/data/models/user_models.dart';

abstract class UserListDS {
  Future<Either<RequestFailure, Set<String>>> getUserIdsAroundPoint({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  });
}

class UserListDSImpl implements UserListDS {
  final FirebaseFirestore _firestore;

  UserListDSImpl(this._firestore);

  String get userCollection => Bag.strings.server.userCollection;
  String get coordinatesCollection => Bag.strings.server.coordinatesCollection;

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
    final userCoordinates = await _firestore
        .collection(coordinatesCollection)
        .where(
          'dateTime',
          isGreaterThan: startDateTime,
        )
        .get();
    final userIds = userCoordinates.docs
        .where((e) => _isInDistance(
              maxDistanceInKm: maxDistanceInKm,
              pointLat: pointLat,
              pointLong: pointLong,
              otherUserLat: e.get('lat'),
              otherUserLong: e.get('long'),
            ))
        .map((e) => e.get('userId') as String)
        .toSet();
    return Right(userIds);
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

  Future<Either<RequestFailure, Set<FullUserModel>>> getUsersByIds(
      Set<String> userIds) async {
    final found = await _firestore
        .collection(userCollection)
        .where('id', whereIn: userIds)
        .get();
    final users = found.docs
        .map(
          (e) => FullUserModel.fromJson(
            e.data(),
          ),
        )
        .toSet();
    return users;
  }
}
