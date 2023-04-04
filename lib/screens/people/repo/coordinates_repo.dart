import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/point_model.dart';
import '../ds/coordinates_local_ds.dart';
import '../ds/coordinates_remote_ds.dart';

abstract class CoordinatesRepo {
  Future<Either<RequestFailure, void>> addCurrentPosition();
  PointModel? getLatestPosition();
  //TODO: add delete point on logout
}

@LazySingleton(as: CoordinatesRepo)
class CoordinatesRepoImpl implements CoordinatesRepo {
  final CoordinatesLocalDS _coordinatesLocalDS;
  final CoordinatesRemoteDS _coordinatesRemoteDS;

  CoordinatesRepoImpl(
    this._coordinatesLocalDS,
    this._coordinatesRemoteDS,
  );

  @override
  Future<Either<RequestFailure, void>> addCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    final currentPoint = PointModel(
      lat: currentPosition.latitude,
      long: currentPosition.longitude,
    );
    _coordinatesLocalDS.addPosition(currentPoint);
    final futureForRemote = _coordinatesRemoteDS.addPosition(currentPoint);

    return futureForRemote;
  }

  @override
  PointModel? getLatestPosition() {
    return _coordinatesLocalDS.getPosition();
  }
}
