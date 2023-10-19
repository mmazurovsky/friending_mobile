import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../auth_and_profile/auth_repo.dart';
import '../client/request_check_wrapper.dart';

abstract class FcmTokenManagementRepo {
  void startListeningToFcmTokenChange();
  Future<void> saveFcmTokenForUserAndDevice();
}

@LazySingleton(as: FcmTokenManagementRepo)
class FcmTokenManagementRepoImpl implements FcmTokenManagementRepo, Disposable {
  final AuthRepo _authRepo;
  final FirebaseMessaging _firebaseMessaging;
  final FcmTokenManagementDS _fcmTokenManagementDS;
  StreamSubscription<String>? _fcmTokenSubscription;

  FcmTokenManagementRepoImpl(
    this._authRepo,
    this._firebaseMessaging,
    this._fcmTokenManagementDS,
  );

  @override
  FutureOr onDispose() {
    _fcmTokenSubscription?.cancel();
  }

  @override
  void startListeningToFcmTokenChange() {
    _fcmTokenSubscription ??= _firebaseMessaging.onTokenRefresh.listen((token) {
      saveFcmTokenForUserAndDevice();
    });
  }

  @override
  Future<void> saveFcmTokenForUserAndDevice() async {
    final currentUserId = _authRepo.currentUser?.uid;
    if (currentUserId != null) {
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        final deviceId = await PlatformDeviceId.getDeviceId;
        final userSecrets = UserSecrets(
          userId: currentUserId,
          fcmToken: fcmToken,
          deviceId: deviceId,
        );
        _fcmTokenManagementDS.saveOrUpdateTokenForUserAndDevice(userSecrets: userSecrets);
      }
    }
  }
}

abstract class FcmTokenManagementDS {
  Future<void> saveOrUpdateTokenForUserAndDevice({
    required UserSecrets userSecrets,
  });
}

@LazySingleton(as: FcmTokenManagementDS)
class FcmTokenManagementDSImpl implements FcmTokenManagementDS {
  final FirebaseFirestore _firestore;
  final RequestCheckWrapper _requestCheckWrapper;

  FcmTokenManagementDSImpl(
    this._firestore,
    this._requestCheckWrapper,
  );

  @override
  Future<void> saveOrUpdateTokenForUserAndDevice({
    required UserSecrets userSecrets,
  }) async {
    final data = userSecrets.toJson();

    final existingRecords =
        await _firestore.collection('userSecrets').where('userId', isEqualTo: userSecrets.userId).where('deviceId', isEqualTo: userSecrets.deviceId).get();

    Future<void>? future;
    if (existingRecords.docs.length > 1) {
      for (final element in existingRecords.docs) {
        await _firestore.collection('userSecrets').doc(element.id).delete();
      }
      future = _firestore.collection('userSecrets').add(data);
    } else if (existingRecords.docs.length == 1) {
      final existingRecordData = existingRecords.docs[0].data();
      final dataIsEqual = mapEquals(data, existingRecordData);
      if (!dataIsEqual) {
        future = _firestore.collection('userSecrets').doc(existingRecords.docs.first.id).update(data);
      }
    } else {
      future = _firestore.collection('userSecrets').add(data);
    }
    if (future != null) {
      return _requestCheckWrapper(future);
    }
  }
}

class UserSecrets {
  final String userId;
  final String fcmToken;
  final String? deviceId;

  UserSecrets({
    required this.userId,
    required this.fcmToken,
    required this.deviceId,
  });

  factory UserSecrets.fromJson(Map<String, dynamic> json) {
    return UserSecrets(
      userId: json['userId'],
      fcmToken: json['fcmToken'],
      deviceId: json['deviceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fcmToken': fcmToken,
      'deviceId': deviceId,
    };
  }
}
