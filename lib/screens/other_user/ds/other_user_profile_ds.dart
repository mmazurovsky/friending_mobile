import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';
import 'connection_models.dart';
import 'pairs_ds.dart';

abstract class OtherUserProfileDS {
  Future<OtherUserFullModel> getOtherUserFullProfile(String userId);
}

@LazySingleton(as: OtherUserProfileDS)
class OtherUserProfileDSImpl implements OtherUserProfileDS, LoggerNameGetter {
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firebaseFirestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;
  final PairsDS _pairsDS;

  const OtherUserProfileDSImpl(
    this._requestCheckWrapper,
    this._firebaseFirestore,
    this._authRepo,
    this._customLogger,
    this._pairsDS,
  );

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';

  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get connectionsCollection => Strings.server.connectionsCollection;
  String get privateInfoUserCollection => Strings.server.privateInfoCollection;

  @override
  Future<OtherUserFullModel> getOtherUserFullProfile(String userId) async {
    final futureShortModel = _firebaseFirestore
        .collection(shortUserCollection)
        .doc(userId)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                ShortReadUserModel.fromJson(snapshot.data()!),
            toFirestore: (ShortReadUserModel model, _) => {})
        .get();

    final futureShortModelRaw = _requestCheckWrapper(futureShortModel);

    final shortModelRaw = await futureShortModelRaw;

    final pairs = await _pairsDS.getUserPairs(userId);

    final ShortReadUserModel shortUserModel = shortModelRaw.data()!;

    late User currentUser;

    final secureUserInfoRaw = await _getSecureFields(userId);

    final publicFields = secureUserInfoRaw.fields
        .where((e) => e.state == SecureFieldStatusEnum.public)
        .toList();

    try {
      currentUser = _authRepo.currentUser;
    } on AuthFailure catch (e) {
      return OtherUserFullModel(
        shortUserModel: shortUserModel,
        pairedWith: pairs.first,
        secureUserInfoModel: SecureUserInfoModel(publicFields),
        connectStatusEnum: UserPairStatusEnum.unpaired,
      );
    }

    final futureConnection = _firebaseFirestore
        .collection(fullUserCollection)
        .doc(currentUser.uid)
        .collection(connectionsCollection)
        .doc(userId)
        .withConverter<ConnectionModel?>(
          fromFirestore: (map, opt) =>
              map.data() != null ? ConnectionModel.fromJson(map.data()!) : null,
          toFirestore: (ConnectionModel? model, opt) => model?.toJson() ?? {},
        )
        .get();

    final futureConnectionRaw = _requestCheckWrapper(futureConnection);

    final connectionRaw = await futureConnectionRaw;

    late UserPairStatusEnum connectStatusEnum;

    if (connectionRaw.data() == null) {
      connectStatusEnum = UserPairStatusEnum.unpaired;
    } else {
      connectStatusEnum = connectionRaw.data()!.status;
    }

    late SecureUserInfoModel secureUserInfo;
    if (connectStatusEnum == UserPairStatusEnum.paired) {
      secureUserInfo = secureUserInfoRaw;
    } else {
      secureUserInfo = SecureUserInfoModel(publicFields);
    }

    return OtherUserFullModel(
      shortUserModel: shortUserModel,
      pairedWith: pairs.first,
      secureUserInfoModel: secureUserInfo,
      connectStatusEnum: connectStatusEnum,
    );
  }

  //TODO in future: get only public fields if users not paired
  Future<SecureUserInfoModel> _getSecureFields(String userId) async {
    final futurePrivateModel = _firebaseFirestore
        .collection(fullUserCollection)
        .doc(userId)
        .collection(privateInfoUserCollection)
        .doc(userId)
        .get();

    final futurePrivateModelRaw = _requestCheckWrapper(futurePrivateModel);

    final privateModelRaw = await futurePrivateModelRaw;

    return SecureUserInfoModel.fromJson(
      privateModelRaw.data()!,
    );
  }
}
