import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/extensions.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class OtherUserProfileDS {
  Future<Either<RequestFailure, OtherUserFullModel>> getOtherUserFullProfile(
      String userId);
}

@LazySingleton(as: OtherUserProfileDS)
class OtherUserProfileDSImpl implements OtherUserProfileDS, LoggerNameGetter {
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firebaseFirestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  const OtherUserProfileDSImpl(
    this._requestCheckWrapper,
    this._firebaseFirestore,
    this._authRepo,
    this._customLogger,
  );

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';

  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get connectionsCollection => Strings.server.connectionsCollection;
  String get privateInfoUserCollection => Strings.server.privateInfoCollection;
  String get additionalInfoUserCollection => Strings.server.fullUsersCollection;

  @override
  Future<Either<RequestFailure, OtherUserFullModel>> getOtherUserFullProfile(
      String userId) async {
    final futureShortModel =
        _firebaseFirestore.collection(shortUserCollection).doc(userId).get();
    final futureAdditionalModel = _firebaseFirestore
        .collection(additionalInfoUserCollection)
        .doc(userId)
        .get();

    final futureShortModelRaw = _requestCheckWrapper(futureShortModel);
    final futureAdditionalModelRaw =
        _requestCheckWrapper(futureAdditionalModel);

    final shortModelRaw = await futureShortModelRaw;
    final additionalModelRaw = await futureAdditionalModelRaw;

    if (shortModelRaw.isLeft()) {
      //TODO: not sure
      return left<RequestFailure, OtherUserFullModel>(
          (shortModelRaw as Left).value as RequestFailure);
    }
    if (additionalModelRaw.isLeft()) {
      //TODO: not sure

      return left<RequestFailure, OtherUserFullModel>(
          (additionalModelRaw as Left).value as RequestFailure);
    }

    late final ShortUserModel shortUserModel;
    late final AdditionalUserModel additionalUserModel;

    shortModelRaw.map(
      (r) => shortUserModel = ShortUserModel.fromJson(
        r.data()!,
      ),
    );
    additionalModelRaw.map(
      (r) => additionalUserModel = AdditionalUserModel.fromJson(
        r.data()!,
      ),
    );

    final currentUserRaw = _authRepo.currentUser;

    late final UserConnectStatusEnum connectStatusEnum;
    final result = await currentUserRaw.fold((l) async {
      if (l is AuthFailure) {
        connectStatusEnum = UserConnectStatusEnum.disconnected;
        return right<RequestFailure, OtherUserFullModel>(
          OtherUserFullModel(
            shortUserModel: shortUserModel,
            additionalUserModel: additionalUserModel,
            privateInfoUserModel: null,
            connectStatusEnum: connectStatusEnum,
          ),
        );
      } else {
        return left<RequestFailure, OtherUserFullModel>(l);
      }
    }, (currentUser) async {
      final futureConnection = _firebaseFirestore
          .collection(additionalInfoUserCollection)
          .doc(userId)
          .collection(connectionsCollection)
          .doc(currentUser.uid)
          .get();

      final futureConnectionRaw = _requestCheckWrapper(futureConnection);

      final connectionRaw = await futureConnectionRaw;

      if (connectionRaw.isLeft()) {
        return left<RequestFailure, OtherUserFullModel>(
            (connectionRaw as Left).value as RequestFailure);
      }

      connectionRaw.map((r) {
        if (!r.exists) {
          connectStatusEnum = UserConnectStatusEnum.disconnected;
        } else {
          final connectionTypeRaw = r.data()!['connectionType'] as String;
          connectStatusEnum =
              connectionTypeRaw.toEnum(UserConnectStatusEnum.values) ??
                  UserConnectStatusEnum.disconnected;
          //TODO: not very clear, better rewrite
          if (connectStatusEnum == UserConnectStatusEnum.disconnected) {
            _customLogger.logMessage(
                loggerName: loggerName,
                level: Level.SEVERE,
                message: 'Connection status is not recognized');
          }
        }
      });

      PrivateInfoUserModel? privateInfoUserModel;
      if (connectStatusEnum == UserConnectStatusEnum.connected) {
        (await _getPrivateInfo(userId)).fold((l) {
          return left<RequestFailure, OtherUserFullModel>(l);
        }, (r) {
          privateInfoUserModel = r;
        });
      }

      return right<RequestFailure, OtherUserFullModel>(
        OtherUserFullModel(
          shortUserModel: shortUserModel,
          additionalUserModel: additionalUserModel,
          privateInfoUserModel: privateInfoUserModel,
          connectStatusEnum: connectStatusEnum,
        ),
      );
    });
    result.fold((l) {
      _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      );
    }, (r) => null);

    return result;
  }

  Future<Either<RequestFailure, PrivateInfoUserModel>> _getPrivateInfo(
      String userId) async {
    final futurePrivateModel = _firebaseFirestore
        .collection(additionalInfoUserCollection)
        .doc(userId)
        .collection(privateInfoUserCollection)
        .doc(userId)
        .get();

    final futurePrivateModelRaw = _requestCheckWrapper(futurePrivateModel);

    final privateModelRaw = await futurePrivateModelRaw;

    return privateModelRaw.fold((l) {
      return left(l);
    }, (r) {
      return right(
        PrivateInfoUserModel.fromJson(
          r.data()!,
        ),
      );
    });
  }
}
