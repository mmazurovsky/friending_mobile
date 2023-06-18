import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../explore/ds/user_list_ds.dart';
import 'connection_models.dart';

abstract class PairsDS {
  Future<List<ShortReadUserModel>> getUserPairs(String userId);
}

@LazySingleton(as: PairsDS)
class PairsDSImpl implements PairsDS {
  final UserListDS _userListDS;
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  PairsDSImpl(this._userListDS, this._requestCheckWrapper, this._firestore,
      this._authRepo, this._customLogger);

  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get connectionsCollection => Strings.server.connectionsCollection;

  @override
  Future<List<ShortReadUserModel>> getUserPairs(String userId) async {
    final pairsFuture = _firestore
        .collection(fullUserCollection)
        .doc(userId)
        .collection(connectionsCollection)
        .withConverter(
            fromFirestore: (json, _) => ConnectionModel.fromJson(json.data()!),
            toFirestore: (model, _) => {})
        .where('status', isEqualTo: UserConnectStatusEnum.connected.toString())
        .get();

    final pairsRaw = await _requestCheckWrapper(pairsFuture);

    final pairs = pairsRaw.docs.map((e) => e.data()).toList();

    //TODO: not sure, need check
    pairs.sort(
      (a, b) => a.stoppedDateTime == null
          ? 0
          : b.stoppedDateTime == null
              ? 1
              : a.stoppedDateTime!.compareTo(b.stoppedDateTime!),
    );

    final userIds = pairs.map((e) => e.userId).toSet();

    final users = _userListDS.getUsersByIds(userIds: userIds);

    return users;
  }
}
