import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/models/user_models.dart';
import '../../profile/ds/profile_remote_ds.dart';

abstract class UserListDS {
  Future<Set<String>> getUserIdsAroundPoint({
    required double pointLat,
    required double pointLong,
    required int maxDistanceInKm,
    required DateTime startDateTime,
  });

  Future<List<ShortReadUserModel>> getUsersByIds({
    required Set<String> userIds,
  });

  Future<Map<String, int>> getUserIdsWithTheseTags({
    required List<String> tags,
  });

  Future<List<ShortReadUserModel>> getFreshUsers(int maxQuantity);
}

@LazySingleton(as: UserListDS)
class UserListDSImpl implements UserListDS {
  final FirebaseFirestore _firestore;
  final GeoFlutterFire _geoFlutterFire;
  final AuthRepo _authRepo;
  final ProfileRemoteDS _profileDS;
  final RequestCheckWrapper _requestCheckWrapper;

  UserListDSImpl(
    this._firestore,
    this._geoFlutterFire,
    this._authRepo,
    this._profileDS,
    this._requestCheckWrapper,
  );

  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get coordinatesCollection => Strings.server.positionsCollection;
  String get tagsCollection => Strings.server.tagsCollection;

  @override
  Future<Set<String>> getUserIdsAroundPoint({
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

    final collectionReferenceWithDateTimeQuery = _firestore
        .collection(coordinatesCollection)
        .where(
          'dateTime',
          isGreaterThan: startDateTime,
        )
        //*INFO: below is needed to execute the query
        .orderBy('dateTime', descending: true);

    final stream = _geoFlutterFire
        .collection(collectionRef: collectionReferenceWithDateTimeQuery)
        .within(
          center: center,
          radius: maxDistanceInKm.toDouble(),
          field: Strings.server.positionField,
          strictMode: false,
        );

    final userCoordinates = await _requestCheckWrapper(stream.first);

    final userIds =
        userCoordinates.map((e) => e.get('userId') as String).toSet();

    return userIds;
  }

  @override
  Future<List<ShortReadUserModel>> getUsersByIds({
    required Set<String> userIds,
  }) async {
    if (userIds.isEmpty) {
      return [];
    }
    final currentUserAndTags = await _profileDS.getCurrentUserAndProfileTags();

    String? currentUserId = currentUserAndTags.item1.uid;
    final Set<String> currentUserTags = currentUserAndTags.item2.toSet();

    userIds.remove(currentUserId);

    final userIdSlices = userIds.slices(10);

    final List<ShortReadUserModel> allUsersInSlices = [];

    for (var userIdSlice in userIdSlices) {
      final future = _firestore
          .collection(shortUserCollection)
          .where(
            'id',
            //INFO: wont work for more than 10 users
            // https://stackoverflow.com/questions/61354866/is-there-a-workaround-for-the-firebase-query-in-limit-to-10
            whereIn: userIdSlice,
          )
          .get();

      final usersRaw = await _requestCheckWrapper(future);

      final users = usersRaw.docs
          .map(
            (e) => ShortReadUserModel.fromJson(
              e.data(),
            ),
          )
          //*INFO: not too clean but ok
          .map((e) => e.copyWith(
                commonTags:
                    currentUserTags.intersection(e.tags.toSet()).toList(),
              ))
          .toList();
      allUsersInSlices.addAll(users);
    }
    return allUsersInSlices;
  }

  @override
  Future<Map<String, int>> getUserIdsWithTheseTags(
      {required List<String> tags}) async {
    final tagSlices = tags.slices(10);

    final allUserIdsFromSlices = <String>[];

    for (var tagSlice in tagSlices) {
      final future = _firestore
          .collection(tagsCollection)
          .where(
            'tagName',
            //TODO: wont work for more than 10 users
            // https://stackoverflow.com/questions/61354866/is-there-a-workaround-for-the-firebase-query-in-limit-to-10
            whereIn: tagSlice,
          )
          .get();
      final anotherFuture = await _requestCheckWrapper(future);
      final tagMapList = anotherFuture.docs;
      final userIds = tagMapList.fold<List<String>>([], (prev, e) {
        prev.addAll(
          (e.get('usersWithThisTag') as List<dynamic>).cast<String>(),
        );
        return prev;
      });

      allUserIdsFromSlices.addAll(userIds);
    }

    final userIdToQuantityOfTagsInCommon = <String, int>{};

    for (var userId in allUserIdsFromSlices) {
      if (userIdToQuantityOfTagsInCommon.containsKey(userId)) {
        userIdToQuantityOfTagsInCommon[userId] =
            userIdToQuantityOfTagsInCommon[userId]! + 1;
      } else {
        userIdToQuantityOfTagsInCommon[userId] = 1;
      }
    }

    return userIdToQuantityOfTagsInCommon;
  }

  @override
  Future<List<ShortReadUserModel>> getFreshUsers(int maxQuantity) async {
    final future = _firestore
        .collection(shortUserCollection)
        .orderBy('createdDateTime', descending: true)
        .limit(maxQuantity)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                ShortReadUserModel.fromJson(snapshot.data()!),
            toFirestore: (ShortReadUserModel model, _) => {})
        .get();

    final result = await _requestCheckWrapper(future);

    final users = result.docs.map((e) => e.data()).toSet().toList();

    return users;
  }
}
