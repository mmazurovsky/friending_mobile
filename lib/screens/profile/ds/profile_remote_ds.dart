import 'dart:async';

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
  Future<Either<RequestFailure, FullReadUserModel?>> getFullProfile();
  Future<Either<RequestFailure, Tuple2<User, List<String>>>>
      getCurrentUserAndProfileTags();
  Future<Either<RequestFailure, void>> updateProfile({
    required ShortUpdateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });
  Future<Either<RequestFailure, void>> saveProfile({
    required ShortCreateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
  });
  Future<Either<RequestFailure, void>> saveProfilePhotos(
      List<String> profilePhotoUrls);

  Future<Either<RequestFailure, List<String>>> getProfilePhotos();
  Future<bool> isUsernameFree(String username);
  Stream<ShortReadUserModel?> getProfileStream();
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
      getCurrentUserAndProfileTags() {
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
        final shortModel = ShortReadUserModel.fromJson(r.data()!);
        final tags = shortModel.tags;
        return Tuple2(user, tags);
      });
    });

    return result;
  }

  @override
  Future<Either<RequestFailure, FullReadUserModel?>> getFullProfile() async {
    final currentUserRaw = _authRepo.currentUser;
    final result = await currentUserRaw.fold(
      (l) async {
        _customLogger.logFailure(loggerName: loggerName, failure: l);
        return left<RequestFailure, FullReadUserModel>(l);
      },
      (r) async {
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
          return left<RequestFailure, FullReadUserModel>(
              (shortModelRaw as Left).value as RequestFailure);
        }
        if (additionalModelRaw.isLeft()) {
          //TODO: not sure

          return left<RequestFailure, FullReadUserModel>(
              (additionalModelRaw as Left).value as RequestFailure);
        }
        if (privateModelRaw.isLeft()) {
          //TODO: not sure

          return left<RequestFailure, FullReadUserModel>(
              (privateModelRaw as Left).value as RequestFailure);
        }

        late final ShortReadUserModel? shortUserModel;
        late final AdditionalUserModel? additionalUserModel;
        late final PrivateInfoUserModel? privateInfoUserModel;

        shortModelRaw.map(
          (r) {
            final data = r.data();
            if (data != null && data.isNotEmpty) {
              shortUserModel = ShortReadUserModel.fromJson(data);
            } else {
              shortUserModel = null;
            }
          },
        );
        additionalModelRaw.map(
          (r) {
            final data = r.data();
            if (data != null && data.isNotEmpty) {
              additionalUserModel = AdditionalUserModel.fromJson(data);
            } else {
              additionalUserModel = null;
            }
          },
        );
        privateModelRaw.map((r) {
          final data = r.data();
          if (data != null && data.isNotEmpty) {
            privateInfoUserModel = PrivateInfoUserModel.fromJson(data);
          } else {
            privateInfoUserModel = null;
          }
        });

        if (shortUserModel != null &&
            additionalUserModel != null &&
            privateInfoUserModel != null) {
          return right<RequestFailure, FullReadUserModel?>(
            FullReadUserModel(
              shortUserModel: shortUserModel!,
              additionalUserModel: additionalUserModel!,
              privateInfoUserModel: privateInfoUserModel!,
            ),
          );
        } else {
          return right<RequestFailure, FullReadUserModel?>(null);
        }
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
  Future<Either<RequestFailure, void>> updateProfile({
    required ShortUpdateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
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
          shortModel.toJson(),
        );
        batch.update(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid),
          additionalModel.toJson(),
        );
        batch.update(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid)
              .collection(privateInfoUserCollection)
              .doc(r.uid),
          privateModel.toJson(),
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
  Future<Either<RequestFailure, void>> saveProfile({
    required ShortCreateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
  }) async {
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
          shortModel.toJson(),
        );
        batch.set(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid),
          additionalModel.toJson(),
        );
        batch.set(
          _firebaseFirestore
              .collection(additionalInfoUserCollection)
              .doc(r.uid)
              .collection(privateInfoUserCollection)
              .doc(r.uid),
          privateModel.toJson(),
        );

        for (var tag in shortModel.tags) {
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

  @override
  Future<Either<RequestFailure, List<String>>> getProfilePhotos() async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold(
      (l) async {
        return left<RequestFailure, DocumentSnapshot<ShortReadUserModel>>(l);
      },
      (r) async {
        final future = _firebaseFirestore
            .collection(shortUserCollection)
            .doc(r.uid)
            // .withConverter(
            //     fromFirestore: (snapshot, _) =>
            //         ShortUserModel.fromJson(snapshot.data()!),
            //     toFirestore: (ShortUserModel model, _) => model.toJson())
            .get();

        final rawResponse = await _requestCheckWrapper(future);

        return rawResponse;
      },
    );

    result.fold((l) {
      _customLogger.logFailure(loggerName: loggerName, failure: l);
      return left<RequestFailure, List<String>>(l);
    }, (r) => null);

    final finalResult = result.map(
      (r) {
        final data = r.data();
        if (data == null) {
          return <String>[];
        } else {
          return List<String>.from(
              (data as Map<String, dynamic>)['photos'] as List);
        }
      },
    );

    return finalResult;
  }

  @override
  Future<bool> isUsernameFree(String username) async {
    final future = _firebaseFirestore
        .collection(shortUserCollection)
        .where('username', isEqualTo: username)
        .get();

    final response = await _requestCheckWrapper(future);

    final result = response.fold((l) {
      _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      );
      throw l;
    }, (r) => r.docs.isEmpty);

    return result;
  }

  @override
  Stream<ShortReadUserModel?> getProfileStream() {
    final currentUserRaw = _authRepo.currentUser;

    final result = currentUserRaw.fold(
      (l) {
        _customLogger.logFailure(
          loggerName: loggerName,
          failure: l,
        );
        throw l;
      },
      (r) {
        final stream = _firebaseFirestore
            .collection(shortUserCollection)
            .doc(r.uid)
            .snapshots()
            .map(
          (snapshot) {
            final data = snapshot.data();
            if (data == null) {
              return null;
            } else {
              return ShortReadUserModel.fromJson(data);
            }
          },
        );
        return stream;
      },
    );

    return result;
  }
}
