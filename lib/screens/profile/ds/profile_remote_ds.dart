import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../other_user/ds/connect_ds.dart';
import '../../other_user/ds/pairs_ds.dart';
import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class ProfileRemoteDS {
  Future<FullReadUserModel?> getFullProfile();
  Future<Tuple2<User, List<String>>> getCurrentUserAndProfileTags();
  Future<void> updateProfile({
    required ShortUpdateUserModel shortModel,
    required SecureUserInfoModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });
  Future<void> saveProfile({
    required ShortCreateUserModel shortModel,
    required SecureUserInfoModel privateModel,
  });
  Future<void> saveProfilePhotos(List<String> profilePhotoUrls);

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
  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get privateInfoUserCollection => Strings.server.privateInfoCollection;
  String get tagsCollection => Strings.server.tagsCollection;

  @override
  Future<Tuple2<User, List<String>>> getCurrentUserAndProfileTags() async {
    final currentUserRaw = _authRepo.currentUser;

    final future = _firebaseFirestore
        .collection(shortUserCollection)
        .doc(currentUserRaw.uid)
        .withConverter<ShortReadUserModel>(
          fromFirestore: (map, _) => ShortReadUserModel.fromJson(map.data()!),
          toFirestore: (model, _) => {},
        )
        .get();

    final result = await _requestCheckWrapper(future);

    final withTags = Tuple2(
      currentUserRaw,
      result.data()!.tags,
    );

    return withTags;
  }

  @override
  Future<FullReadUserModel?> getFullProfile() async {
    final currentUserRaw = _authRepo.currentUser;

    final futureShortModel = _firebaseFirestore
        .collection(shortUserCollection)
        .doc(currentUserRaw.uid)
        .withConverter(
          fromFirestore: (json, opt) => json.data() != null
              ? ShortReadUserModel.fromJson(json.data()!)
              : null,
          toFirestore: (model, opt) => {},
        )
        .get();

    final futurePrivateModel = _firebaseFirestore
        .collection(fullUserCollection)
        .doc(currentUserRaw.uid)
        .collection(privateInfoUserCollection)
        .doc(currentUserRaw.uid)
        .withConverter(
          fromFirestore: (json, opt) => json.data() != null
              ? SecureUserInfoModel.fromJson(json.data()!)
              : null,
          toFirestore: (model, opt) => {},
        )
        .get();

    final futureShortModelRaw = _requestCheckWrapper(futureShortModel);
    final futurePrivateModelRaw = _requestCheckWrapper(futurePrivateModel);

    final shortModelRaw = await futureShortModelRaw;
    final privateModelRaw = await futurePrivateModelRaw;

    final ShortReadUserModel? shortUserModel = shortModelRaw.data();
    final SecureUserInfoModel? privateInfoUserModel = privateModelRaw.data();

    if (shortUserModel != null && privateInfoUserModel != null) {
      return FullReadUserModel(
        shortUserModel: shortUserModel,
        secureUserInfoModel: privateInfoUserModel,
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> updateProfile({
    required ShortUpdateUserModel shortModel,
    required SecureUserInfoModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  }) async {
    final currentUserRaw = _authRepo.currentUser;

    final batch = _firebaseFirestore.batch();

    batch.update(
      _firebaseFirestore
          .collection(shortUserCollection)
          .doc(currentUserRaw.uid),
      shortModel.toJson(),
    );

    batch.update(
      _firebaseFirestore
          .collection(fullUserCollection)
          .doc(currentUserRaw.uid)
          .collection(privateInfoUserCollection)
          .doc(currentUserRaw.uid),
      privateModel.toJson(),
    );

    for (final tag in tagsToRemove) {
      batch.update(
        _firebaseFirestore.collection(tagsCollection).doc(tag),
        {
          'usersWithThisTag': FieldValue.arrayRemove([currentUserRaw.uid]),
        },
      );
    }

    for (final tag in tagsToAdd) {
      batch.set(
        _firebaseFirestore.collection(tagsCollection).doc(tag),
        {
          'tagName': tag,
          'usersWithThisTag': FieldValue.arrayUnion([currentUserRaw.uid]),
        },
        SetOptions(merge: true),
      );
    }

    final rawResponse = await _requestCheckWrapper(batch.commit());

    return rawResponse;
  }

  @override
  Future<void> saveProfile({
    required ShortCreateUserModel shortModel,
    required SecureUserInfoModel privateModel,
  }) async {
    // assert(user.shortUserModel.soulsCount != null);
    final currentUserRaw = _authRepo.currentUser;

    final batch = _firebaseFirestore.batch();
    batch.set(
      _firebaseFirestore
          .collection(shortUserCollection)
          .doc(currentUserRaw.uid),
      shortModel.toJson(),
    );
    batch.set(
      _firebaseFirestore
          .collection(fullUserCollection)
          .doc(currentUserRaw.uid)
          .collection(privateInfoUserCollection)
          .doc(currentUserRaw.uid),
      privateModel.toJson(),
    );

    for (var tag in shortModel.tags) {
      //TODO: check if it works
      batch.set(
        _firebaseFirestore.collection(tagsCollection).doc(tag),
        {
          'tagName': tag,
          'usersWithThisTag': FieldValue.arrayUnion([currentUserRaw.uid]),
        },
        SetOptions(merge: true),
      );
    }

    final future = batch.commit();

    final rawResponse = await _requestCheckWrapper(future);

    return rawResponse;
  }

  @override
  Future<void> saveProfilePhotos(List<String> profilePhotoUrls) async {
    final currentUserRaw = _authRepo.currentUser;

    final future = _firebaseFirestore
        .collection(shortUserCollection)
        .doc(currentUserRaw.uid)
        .set(
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
  }

  // @override
  // Future<List<String>> getProfilePhotos() async {
  //   final currentUserRaw = _authRepo.currentUser;

  //       final future = _firebaseFirestore
  //           .collection(shortUserCollection)
  //           .doc(r.uid)
  //           // .withConverter(
  //           //     fromFirestore: (snapshot, _) =>
  //           //         ShortUserModel.fromJson(snapshot.data()!),
  //           //     toFirestore: (ShortUserModel model, _) => model.toJson())
  //           .get();

  //       final rawResponse = await _requestCheckWrapper(future);

  //       return rawResponse;
  //     },

  //   result.fold((l) {
  //     _customLogger.logFailure(loggerName: loggerName, failure: l);
  //     return left<RequestFailure, List<String>>(l);
  //   }, (r) => null);

  //   final finalResult = result.map(
  //     (r) {
  //       final data = r.data();
  //       if (data == null) {
  //         return <String>[];
  //       } else {
  //         return List<String>.from(
  //             (data as Map<String, dynamic>)['photos'] as List);
  //       }
  //     },
  //   );

  //   return finalResult;
  // }

  @override
  Future<bool> isUsernameFree(String username) async {
    final future = _firebaseFirestore
        .collection(shortUserCollection)
        .where('username', isEqualTo: username)
        .get();

    final response = await _requestCheckWrapper(future);

    return response.docs.isEmpty;
  }

  @override
  Stream<ShortReadUserModel?> getProfileStream() {
    final currentUserRaw = _authRepo.currentUser;

    final stream = _firebaseFirestore
        .collection(shortUserCollection)
        .doc(currentUserRaw.uid)
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
  }
}
