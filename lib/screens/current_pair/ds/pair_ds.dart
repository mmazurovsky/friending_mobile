import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../explore/ds/user_list_ds.dart';
import '../../other_user/ds/connection_models.dart';

abstract class PairDS {
  // Future<List<ShortReadUserModel>> getUserPairs(String userId);
  Future<ShortReadUserModel?> getCurrentPairOfUser(String userId);
  Future<ShortReadUserModel> getShortUserById(String userId);
}

@LazySingleton(as: PairDS)
class PairDSImpl implements PairDS {
  // final UserListDS _userListDS;
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  PairDSImpl(
    // this._userListDS,
    this._requestCheckWrapper,
    this._firestore,
    this._authRepo,
    this._customLogger,
  );

  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get connectionsCollection => Strings.server.connectionsCollection;

  // @override
  // Future<List<ShortReadUserModel>> getUserPairs(String userId) async {
  //   final pairsFuture = _firestore
  //       .collection(fullUserCollection)
  //       .doc(userId)
  //       .collection(connectionsCollection)
  //       .withConverter(fromFirestore: (json, _) => ConnectionModel.fromJson(json.data()!), toFirestore: (model, _) => {})
  //       .where('status', isEqualTo: UserPairStatusEnum.paired.toString())
  //       .get();

  //   final pairsRaw = await _requestCheckWrapper(pairsFuture);

  //   final pairs = pairsRaw.docs.map((e) => e.data()).toList();

  //   //TODO: not sure, need check
  //   pairs.sort(
  //     (a, b) => a.endedDateTime == null
  //         ? 0
  //         : b.endedDateTime == null
  //             ? 1
  //             : a.endedDateTime!.compareTo(b.endedDateTime!),
  //   );

  //   final userIds = pairs.map((e) => e.userId).toSet();

  //   final users = _userListDS.getUsersByIds(userIds: userIds);

  //   return users;
  // }

  @override
  Future<ShortReadUserModel?> getCurrentPairOfUser(String userId) async {
    final pairsFuture = _firestore
        .collection(fullUserCollection)
        .doc(userId)
        .collection(connectionsCollection)
        .withConverter(fromFirestore: (json, _) => ConnectionModel.fromJson(json.data()!), toFirestore: (model, _) => {})
        .where('status', isEqualTo: UserPairStatusEnum.paired.toString())
        .get();

    final pairsRaw = await _requestCheckWrapper(pairsFuture);

    final pairs = pairsRaw.docs.map((e) => e.data()).toList();

    //TODO: not sure, need check
    final activePairs = pairs.where((e) => e.endedDateTime == null).toList();
    if (activePairs.isEmpty) {
      return null;
    } else if (activePairs.length == 1) {
      return getShortUserById(activePairs.first.userId);
    } else {
      //TODO log in important place
      return getShortUserById(activePairs.first.userId);
    }
  }

  @override
  Future<ShortReadUserModel> getShortUserById(String userId) async {
    final future = _firestore
        .collection(shortUserCollection)
        .doc(userId)
        .withConverter(fromFirestore: (json, _) => ShortReadUserModel.fromJson(json.data()!), toFirestore: (model, _) => {})
        .get();

    final raw = await _requestCheckWrapper(future);

    return raw.data()!;
  }
}
