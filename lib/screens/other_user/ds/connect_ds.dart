import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/bag.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/enums.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class ConnectDS {
  Future<Either<RequestFailure, void>> initialConnection(String userId);
  Future<Either<RequestFailure, void>> approveConnection(String userId);
  Future<Either<RequestFailure, void>> disconnect(String userId);
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

  String get userCollection => Bag.strings.server.shortUsersCollection;
  String get connectionsCollection => Bag.strings.server.connectionsCollection;

  @override
  Future<Either<RequestFailure, void>> initialConnection(String userId) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold((l) async {
      return left<RequestFailure, void>(l);
    }, (r) async {
      final dateTime = DateTime.now();
      final currentUserId = r.uid;
      final batchOperation = _firestore.batch();
      batchOperation.set(
        _firestore
            .collection(userCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
        {
          'userId': currentUserId,
          'connectionType': UserConnectStatusEnum.toBeApproved.toString(),
          'dateTime': dateTime,
        },
      );
      batchOperation.set(
        _firestore
            .collection(userCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
        {
          'userId': userId,
          'connectionType': UserConnectStatusEnum.requested.toString(),
          'dateTime': dateTime,
        },
      );
      final future = batchOperation.commit();
      final result = await _requestCheckWrapper(future);
      return result;
    });

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
  Future<Either<RequestFailure, void>> approveConnection(String userId) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold((l) async {
      return left<RequestFailure, void>(l);
    }, (r) async {
      final dateTime = DateTime.now();
      final currentUserId = r.uid;
      final batchOperation = _firestore.batch();
      batchOperation.set(
        _firestore
            .collection(userCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
        {
          'userId': currentUserId,
          'connectionType': UserConnectStatusEnum.connected.toString(),
          'dateTime': dateTime,
        },
      );
      batchOperation.set(
        _firestore
            .collection(userCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
        {
          'userId': userId,
          'connectionType': UserConnectStatusEnum.connected.toString(),
          'dateTime': dateTime,
        },
      );
      final future = batchOperation.commit();
      final result = await _requestCheckWrapper(future);

      return result;
    });

    result.fold(
      (l) => _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      ),
      (r) => null,
    );

    return result;
  }

  @override
  Future<Either<RequestFailure, void>> disconnect(String userId) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold((l) async {
      return left<RequestFailure, void>(l);
    }, (r) async {
      final currentUserId = r.uid;
      final batchOperation = _firestore.batch();
      batchOperation.delete(
        _firestore
            .collection(userCollection)
            .doc(userId)
            .collection(connectionsCollection)
            .doc(currentUserId),
      );
      batchOperation.delete(
        _firestore
            .collection(userCollection)
            .doc(currentUserId)
            .collection(connectionsCollection)
            .doc(userId),
      );
      final future = batchOperation.commit();
      final result = await _requestCheckWrapper(future);

      return result;
    });

    result.fold(
      (l) => _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      ),
      (r) => null,
    );

    return result;
  }
}
