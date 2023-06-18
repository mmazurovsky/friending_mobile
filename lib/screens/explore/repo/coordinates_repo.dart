import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/point_model.dart';
import '../ds/coordinates_local_ds.dart';
import '../ds/coordinates_remote_ds.dart';

abstract class CoordinatesRepo {
  Future<void> addCurrentPosition();
  PointModel? getLatestPosition();
  Future<void> deleteLocalPosition();
}

@Singleton(as: CoordinatesRepo)
class CoordinatesRepoImpl implements CoordinatesRepo {
  final CoordinatesLocalDS _coordinatesLocalDS;
  final CoordinatesRemoteDS _coordinatesRemoteDS;

  CoordinatesRepoImpl(
    this._coordinatesLocalDS,
    this._coordinatesRemoteDS,
  ) {
    addCurrentPosition();
  }

  DateTime? _lastPositionUpdate;

  @override
  Future<void> addCurrentPosition() async {
    if (_lastPositionUpdate != null) {
      final now = DateTime.now();
      final diff = now.difference(_lastPositionUpdate!);
      if (diff.inMinutes < 5) {
        return;
      }
    }

    _lastPositionUpdate = DateTime.now();

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final currentPosition = await Geolocator.getCurrentPosition();
      final currentPoint = PointModel(
        lat: currentPosition.latitude,
        long: currentPosition.longitude,
      );
      _coordinatesLocalDS.addPosition(currentPoint);
      final futureForRemote = _coordinatesRemoteDS.addPosition(currentPoint);

      return futureForRemote;
    } else {
      _lastPositionUpdate = null;
      await _coordinatesLocalDS.deletePosition();
      throw RequestFailure.client(
        m: Strings.failures.clientFailure,
        e: Exception("Permission to access location denied"),
      );
    }
  }

  @override
  PointModel? getLatestPosition() {
    return _coordinatesLocalDS.getPosition();
  }

  @override
  Future<void> deleteLocalPosition() {
    return _coordinatesLocalDS.deletePosition();
  }
}
