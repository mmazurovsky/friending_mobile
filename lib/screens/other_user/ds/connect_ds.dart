import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';
import 'connection_models.dart';

abstract class ConnectDS {
  Future<void> pair(String userId);
  Future<void> unpairOrRemoveRequest(String userId);
}

@LazySingleton(as: ConnectDS)
class ConnectDSImpl implements ConnectDS, LoggerNameGetter {
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  ConnectDSImpl(
    this._requestCheckWrapper,
    this._firestore,
    this._authRepo,
    this._customLogger,
  );

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';

  String get fullUserCollection => Strings.server.fullUsersCollection;
  String get shortUserCollection => Strings.server.shortUsersCollection;
  String get connectionsCollection => Strings.server.connectionsCollection;

  @override
  Future<void> pair(
    String userId,
  ) async {
    final currentUserRaw = _authRepo.currentUser;

    late Future<void> future;

    final currentUserId = currentUserRaw.uid;

    final currentConnectionRaw = await _firestore
        .collection(fullUserCollection)
        .doc(currentUserId)
        .collection(connectionsCollection)
        .doc(userId)
        .withConverter<ConnectionModel?>(
          fromFirestore: (map, opt) =>
              map.data() != null ? ConnectionModel.fromJson(map.data()!) : null,
          toFirestore: (ConnectionModel? model, opt) => model?.toJson() ?? {},
        )
        .get();

    final currentConnection = currentConnectionRaw.data();

    if (currentConnection?.status == UserConnectStatusEnum.toBeApproved) {
      final batchOperation = _firestore.batch();
      final dateTime = DateTime.now();
      batchOperation.update(
        _firestore
            .collection(fullUserCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
        // TODO check if user is already connected with someone and disconnect them
        {'status': UserConnectStatusEnum.connected.toString()},
      );
      batchOperation.set(
        _firestore
            .collection(fullUserCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
        // TODO check if user is already connected with someone and disconnect them
        ConnectionModel(
          userId: userId,
          status: UserConnectStatusEnum.connected,
          createdDateTime: dateTime,
        ).toJson(),
      );
    } else {
      final batchOperation = _firestore.batch();
      final dateTime = DateTime.now();
      batchOperation.set(
        _firestore
            .collection(fullUserCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
        ConnectionModel(
          userId: currentUserId,
          status: UserConnectStatusEnum.toBeApproved,
          createdDateTime: dateTime,
        ).toJson(),
      );
      batchOperation.set(
        _firestore
            .collection(fullUserCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
        ConnectionModel(
          userId: currentUserId,
          status: UserConnectStatusEnum.requested,
          createdDateTime: dateTime,
        ).toJson(),
      );
      future = batchOperation.commit();
    }

    final result = await _requestCheckWrapper(future);
    return result;
  }

  @override
  Future<void> unpairOrRemoveRequest(String userId) async {
    final currentUserRaw = _authRepo.currentUser;

    late Future<void> future;
    final currentUserId = currentUserRaw.uid;
    final currentConnectionRaw = await _firestore
        .collection(fullUserCollection)
        .doc(currentUserId)
        .collection(connectionsCollection)
        .doc(userId)
        .withConverter<ConnectionModel?>(
          fromFirestore: (map, opt) =>
              map.data() != null ? ConnectionModel.fromJson(map.data()!) : null,
          toFirestore: (ConnectionModel? model, opt) => model?.toJson() ?? {},
        )
        .get();

    final currentConnection = currentConnectionRaw.data();

    if (currentConnection?.status == UserConnectStatusEnum.connected) {
      // Unpair
      final batchOperation = _firestore.batch();
      final dateTime = DateTime.now();
      batchOperation.update(
        _firestore
            .collection(fullUserCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
        {'stoppedDateTime': dateTime.toIso8601String()},
      );
      batchOperation.update(
        _firestore
            .collection(fullUserCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
        {'stoppedDateTime': dateTime.toIso8601String()},
      );
      future = batchOperation.commit();
    } else {
      // Remove pair request
      final batchOperation = _firestore.batch();
      batchOperation.delete(
        _firestore
            .collection(fullUserCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
      );
      batchOperation.delete(
        _firestore
            .collection(fullUserCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
      );
      future = batchOperation.commit();
    }

    final result = await _requestCheckWrapper(future);

    return result;
  }
}
