import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/bag.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';

abstract class CoordinatesDS {}

class CoordinatesDSImpl implements CoordinatesDS {
  final FirebaseFirestore _firestore;
  final GeoFlutterFire _geoFlutterFire;
  final AuthRepo _authRepo;
  final RequestCheckWrapper _requestCheckWrapper;

  CoordinatesDSImpl(
    this._firestore,
    this._geoFlutterFire,
    this._authRepo,
    this._requestCheckWrapper,
  );

  String get coordinatesCollection => Bag.strings.server.coordinatesCollection;

  Future<Either<RequestFailure, void>> addPosition({
    required double pointLat,
    required double pointLong,
  }) async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold(
      (l) async => left<RequestFailure, void>(l),
      (r) async {
        final point = _geoFlutterFire.point(
          latitude: pointLat,
          longitude: pointLong,
        );

        final data = {
          'position': point.data,
          'userId': r.uid,
          'dateTime': DateTime.now(),
        };

        final future = _firestore.collection(coordinatesCollection).add(data);

        final response = await _requestCheckWrapper(future);

        return response.map((r) => null);
      },
    );

    return result;
  }
}
