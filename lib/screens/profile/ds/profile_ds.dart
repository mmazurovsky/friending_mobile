import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/bag.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class ProfileDS {
  Future<Either<RequestFailure, FullUserModel>> getProfile();
  Future<Either<RequestFailure, void>> setOrUpdateProfile(FullUserModel user);
}

@LazySingleton(as: ProfileDS)
class ProfileDSImpl implements ProfileDS, LoggerNameGetter {
  final AuthRepo _authRepo;
  final FirebaseFirestore _firebaseFirestore;
  final RequestCheckWrapper _requestCheckWrapper;
  final CustomLogger _customLogger;

  ProfileDSImpl(
    this._authRepo,
    this._firebaseFirestore,
    this._requestCheckWrapper,
    this._customLogger,
  );

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';
  String get shortUserCollection => Bag.strings.server.shortUsersCollection;
  String get additionalInfoUserCollection =>
      Bag.strings.server.fullUsersCollection;
  String get privateInfoUserCollection =>
      Bag.strings.server.privateInfoCollection;

  @override
  Future<Either<RequestFailure, FullUserModel>> getProfile() async {
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold((l) async {
      return left<RequestFailure, FullUserModel>(l);
    }, (r) async {
      final futureShortModel =
          _firebaseFirestore.collection(shortUserCollection).doc(r.uid).get();
      final futureAdditionalModel = _firebaseFirestore
          .collection(additionalInfoUserCollection)
          .doc(r.uid)
          .get();
      final futurePrivateModel = _firebaseFirestore
          .collection(additionalInfoUserCollection)
          .doc(r.uid)
          .collection(privateInfoUserCollection)
          .doc(r.uid)
          .get();

      final futureShortModelRaw = _requestCheckWrapper(futureShortModel);
      final futureAdditionalModelRaw =
          _requestCheckWrapper(futureAdditionalModel);
      final futurePrivateModelRaw = _requestCheckWrapper(futurePrivateModel);

      final shortModelRaw = await futureShortModelRaw;
      final additionalModelRaw = await futureAdditionalModelRaw;
      final privateModelRaw = await futurePrivateModelRaw;

      if (shortModelRaw.isLeft()) {
        //TODO: not sure
        return left<RequestFailure, FullUserModel>(
            (shortModelRaw as Left).value as RequestFailure);
      }
      if (additionalModelRaw.isLeft()) {
        //TODO: not sure

        return left<RequestFailure, FullUserModel>(
            (additionalModelRaw as Left).value as RequestFailure);
      }
      if (privateModelRaw.isLeft()) {
        //TODO: not sure

        return left<RequestFailure, FullUserModel>(
            (privateModelRaw as Left).value as RequestFailure);
      }

      late final ShortUserModel shortUserModel;
      late final AdditionalUserModel additionalUserModel;
      late final PrivateInfoUserModel privateInfoUserModel;

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
      privateModelRaw.map(
        (r) => privateInfoUserModel = PrivateInfoUserModel.fromJson(
          r.data()!,
        ),
      );
      return right<RequestFailure, FullUserModel>(
        FullUserModel(
          shortUserModel: shortUserModel,
          additionalUserModel: additionalUserModel,
          privateInfoUserModel: privateInfoUserModel,
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

  @override
  Future<Either<RequestFailure, void>> setOrUpdateProfile(
      FullUserModel user) async {
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold(
      (l) async {
        return left(l);
      },
      (r) async {
        final future1 = _firebaseFirestore
            .collection(shortUserCollection)
            .doc(r.uid)
            .set(user.shortUserModel.toJson());
        final future2 = _firebaseFirestore
            .collection(additionalInfoUserCollection)
            .doc(r.uid)
            .set(user.additionalUserModel.toJson());
        final future3 = _firebaseFirestore
            .collection(additionalInfoUserCollection)
            .doc(r.uid)
            .collection(privateInfoUserCollection)
            .doc(r.uid)
            .set(user.privateInfoUserModel.toJson());
        final rawFutureResponse1 = _requestCheckWrapper(future1);
        final rawFutureResponse2 = _requestCheckWrapper(future2);
        final rawFutureResponse3 = _requestCheckWrapper(future3);

        final rawResponse1 = await rawFutureResponse1;
        final rawResponse2 = await rawFutureResponse2;
        final rawResponse3 = await rawFutureResponse3;

        if (rawResponse1.isLeft()) {
          return rawResponse1;
        }
        if (rawResponse2.isLeft()) {
          return rawResponse2;
        }
        if (rawResponse3.isLeft()) {
          return rawResponse3;
        }
        return right<RequestFailure, void>(null);
      },
    );
    result.fold((l) {
      _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      );
    }, (r) => null);
    return result;
  }
}
