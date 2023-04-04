import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/point_model.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class CoordinatesRemoteDS {
  Future<Either<RequestFailure, void>> addPosition(PointModel point);
}

class CoordinatesDSImpl implements CoordinatesRemoteDS, LoggerNameGetter {
  final FirebaseFirestore _firestore;
  final GeoFlutterFire _geoFlutterFire;
  final AuthRepo _authRepo;
  final RequestCheckWrapper _requestCheckWrapper;
  final CustomLogger _customLogger;

  CoordinatesDSImpl(
    this._firestore,
    this._geoFlutterFire,
    this._authRepo,
    this._requestCheckWrapper,
    this._customLogger,
  );

  String get coordinatesCollection => Strings.server.positionsCollection;

  @override
  Future<Either<RequestFailure, void>> addPosition(
    PointModel point,
  ) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold(
      (l) async => left<RequestFailure, void>(l),
      (r) async {
        final newPoint = _geoFlutterFire.point(
          latitude: point.lat,
          longitude: point.long,
        );

        final data = {
          'position': newPoint.data,
          'userId': r.uid,
          'dateTime': DateTime.now(),
        };

        final future = _firestore.collection(coordinatesCollection).add(data);

        final response = await _requestCheckWrapper(future);

        return response.map((r) => null);
      },
    );

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
  String get loggerName => '$runtimeType #${identityHashCode(this)}';
}
