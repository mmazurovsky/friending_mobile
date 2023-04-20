import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class ProfileRemoteDS {
  Future<Either<RequestFailure, FullUserModel>> getProfile();
  Future<Either<RequestFailure, Tuple2<User, List<String>>>>
      getUserAndProfileTags();
  Future<Either<RequestFailure, void>> updateProfile(
    FullUserModel user, {
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });
  Future<Either<RequestFailure, void>> saveProfile(FullUserModel user);
  Future<Either<RequestFailure, void>> saveProfilePhotos(
      List<String> profilePhotoUrls);
}

@LazySingleton(as: ProfileRemoteDS)
class ProfileDSImpl implements ProfileRemoteDS, LoggerNameGetter {
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
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get additionalInfoUserCollection => Strings.server.fullUsersCollection;
  String get privateInfoUserCollection => Strings.server.privateInfoCollection;
  String get tagsCollection => Strings.server.tagsCollection;

  @override
  Future<Either<RequestFailure, Tuple2<User, List<String>>>>
      getUserAndProfileTags() {
    final currentUserRaw = _authRepo.currentUser;
    final result = currentUserRaw.fold((l) async {
      return left<RequestFailure, Tuple2<User, List<String>>>(l);
    }, (user) async {
      final future = _firebaseFirestore
          .collection(shortUserCollection)
          .doc(user.uid)
          .get();

      final result = await _requestCheckWrapper(future);

      return result.map((r) {
        final shortModel = ShortUserModel.fromJson(r.data()!);
        final tags = shortModel.commonTags;
        return Tuple2(user, tags);
      });
    });

    return result;
  }

  @override
  Future<Either<RequestFailure, FullUserModel>> getProfile() async {
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold((l) async {
      _customLogger.logFailure(loggerName: loggerName, failure: l);
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
  Future<Either<RequestFailure, void>> updateProfile(
    FullUserModel user, {
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  }) async {
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold(
      (l) async {
        return left(l);
      },
      (r) async {
        final batch = _firebaseFirestore.batch();

        batch.update(
          _firebaseFirestore.collection(shortUserCollection).doc(r.uid),
          user.shortUserModel.toJson(),
        );
        batch.update(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid),
          user.additionalUserModel.toJson(),
        );
        batch.update(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid)
              .collection(privateInfoUserCollection)
              .doc(r.uid),
          user.privateInfoUserModel.toJson(),
        );

        for (final tag in tagsToRemove) {
          batch.update(
            _firebaseFirestore.collection(tagsCollection).doc(tag),
            {
              'usersWithThisTag': FieldValue.arrayRemove([r.uid]),
            },
          );
        }

        for (final tag in tagsToAdd) {
          batch.update(
            _firebaseFirestore.collection(tagsCollection).doc(tag),
            {
              'usersWithThisTag': FieldValue.arrayUnion([r.uid]),
            },
          );
        }

        final rawResponse = await _requestCheckWrapper(batch.commit());

        return rawResponse;
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

  @override
  Future<Either<RequestFailure, void>> saveProfile(FullUserModel user) async {
    // assert(user.shortUserModel.soulsCount != null);
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold(
      (l) async {
        return left(l);
      },
      (r) async {
        final batch = _firebaseFirestore.batch();
        batch.set(
          _firebaseFirestore.collection(shortUserCollection).doc(r.uid),
          //TODO: not very clean
          user.shortUserModel.toJson().putIfAbsent('soulsCount', () => 0),
        );
        batch.set(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid),
          user.additionalUserModel.toJson(),
        );
        batch.set(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid)
              .collection(privateInfoUserCollection)
              .doc(r.uid),
          user.privateInfoUserModel.toJson(),
        );

        for (var tag in user.shortUserModel.tags) {
          //TODO: check if it works
          batch.set(
            _firebaseFirestore.collection(tagsCollection).doc(tag),
            {
              'tagName': tag,
              'usersWithThisTag': FieldValue.arrayUnion([r.uid]),
            },
            SetOptions(merge: true),
          );
        }

        final future = batch.commit();

        final rawResponse = await _requestCheckWrapper(future);

        return rawResponse;
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

  @override
  Future<Either<RequestFailure, void>> saveProfilePhotos(
      List<String> profilePhotoUrls) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold(
      (l) async {
        return left(l);
      },
      (r) async {
        final future =
            _firebaseFirestore.collection(shortUserCollection).doc(r.uid).set(
          {
            'photos': profilePhotoUrls,
          },
          SetOptions(
            // merge: true,
            mergeFields: ['photos'],
          ),
        );

        final rawResponse = await _requestCheckWrapper(future);

        return rawResponse;
      },
    );

    result.fold(
      (l) {
        _customLogger.logFailure(
          loggerName: loggerName,
          failure: l,
        );
      },
      (r) => null,
    );

    return result;
  }
}
