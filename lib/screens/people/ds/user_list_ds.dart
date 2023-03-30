import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../profile/ds/profile_ds.dart';

abstract class UserListDS {
  Future<Either<RequestFailure, Set<String>>> getUserIdsAroundPoint({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  });

  Future<Either<RequestFailure, List<ShortUserModel>>> getUsersByIds({
    required Set<String> userIds,
  });

  Future<Map<String, int>> getUserIdsWithTheseTags({
    required List<String> tags,
  });
}

class UserListDSImpl implements UserListDS {
  final FirebaseFirestore _firestore;
  final GeoFlutterFire _geoFlutterFire;
  final AuthRepo _authRepo;
  final ProfileDS _profileDS;
  final RequestCheckWrapper _requestCheckWrapper;

  UserListDSImpl(
    this._firestore,
    this._geoFlutterFire,
    this._authRepo,
    this._profileDS,
    this._requestCheckWrapper,
  );

  String get userCollection => Strings.server.shortUsersCollection;
  String get coordinatesCollection => Strings.server.positionsCollection;
  String get tagsCollection => Strings.server.tagsCollection;

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

    // Create a geoFirePoint
    GeoFirePoint center = _geoFlutterFire.point(
      latitude: pointLat,
      longitude: pointLong,
    );

    final collectionReferenceWithDateTimeQuery =
        _firestore.collection(coordinatesCollection).where(
              'dateTime',
              isGreaterThan: startDateTime,
            );

    final future = _geoFlutterFire
        .collection(collectionRef: collectionReferenceWithDateTimeQuery)
        .within(
          center: center,
          radius: maxDistanceInKm.toDouble(),
          field: Strings.server.positionField,
          strictMode: false,
        )
        .first;

    final userCoordinates = await _requestCheckWrapper.call(future);

    final userIds = userCoordinates.map((r) {
      // final userIds = r
      //     .where((e) => _isInDistance(
      //           maxDistanceInKm: maxDistanceInKm,
      //           pointLat: pointLat,
      //           pointLong: pointLong,
      //           otherUserLat: e.get('lat'),
      //           otherUserLong: e.get('long'),
      //         ))
      //     .map((e) => e.get('userId') as String)
      //     .toSet();
      // return userIds;

      final userIds = r.map((e) => e.get('userId') as String).toSet();
      return userIds;
    });

    return userIds;
  }

  // bool _isInDistance({
  //   required double pointLat,
  //   required double pointLong,
  //   required double otherUserLat,
  //   required double otherUserLong,
  //   required int maxDistanceInKm,
  // }) {
  //   final distanceBetweenUsers = _distanceBetweenTwoPointsInKm(
  //     lat1: pointLat,
  //     lon1: pointLong,
  //     lat2: otherUserLat,
  //     lon2: otherUserLong,
  //   );
  //   return distanceBetweenUsers <= maxDistanceInKm;
  // }

  // double _distanceBetweenTwoPointsInKm({
  //   required double lat1,
  //   required double lon1,
  //   required double lat2,
  //   required double lon2,
  // }) {
  //   const p = 0.017453292519943295; // Math.PI / 180
  //   const c = cos;
  //   final a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   // 2 * R; R = 6371 km
  //   final result = 12742 * asin(sqrt(a));
  //   return result;
  // }

  @override
  Future<Either<RequestFailure, List<ShortUserModel>>> getUsersByIds({
    required Set<String> userIds,
  }) async {
    final currentUserAndTags = await _profileDS.getUserAndProfileTags();

    String? currentUserId;
    final Set<String> currentUserTags = {};

    currentUserAndTags.map((r) {
      currentUserId = r.value1.uid;
      currentUserTags.addAll(r.value2);
    });

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

    final usersRaw = await _requestCheckWrapper(future);

    final users = usersRaw.map(
      (r) => r.docs
          .map(
            (e) => ShortUserModel.fromJson(
              e.data(),
            ),
          )
          .map((e) => e.copyWith(
              commonTags:
                  currentUserTags.intersection(e.commonTags.toSet()).toList()))
          .toList(),
    );

    return users;
  }

  @override
  Future<Map<String, int>> getUserIdsWithTheseTags(
      {required List<String> tags}) async {
    final userIdToTagsInCommon = <String, int>{};
    final future = _firestore
        .collection(tagsCollection)
        .where('tagName', whereIn: tags)
        .get();
    final a = await _requestCheckWrapper.call(future);
    final b = a.map((r) => r.docs);
    final c =
        b.getOrElse(() => <QueryDocumentSnapshot<Map<String, dynamic>>>[]);
    final userIds = c.fold<List<String>>([], (prev, e) {
      prev.addAll(e.get('usersWithThisTag') as List<String>);
      return prev;
    }).toSet();
    for (var userId in userIds) {
      if (userIdToTagsInCommon.containsKey(userId)) {
        userIdToTagsInCommon[userId] = userIdToTagsInCommon[userId]! + 1;
      } else {
        userIdToTagsInCommon[userId] = 1;
      }
    }

    return userIdToTagsInCommon;
  }
}
