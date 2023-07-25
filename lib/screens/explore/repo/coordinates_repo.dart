import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/point_model.dart';
import '../ds/coordinates_local_ds.dart';
import '../ds/coordinates_remote_ds.dart';

abstract class CoordinatesRepo {
  Future<void> addCurrentPositionToRemoteAndLocal();
  PointModel? getLatestPositionFromLocal();
  Future<void> deleteLocalPositionFromLocal();
}

@Singleton(as: CoordinatesRepo)
class CoordinatesRepoImpl implements CoordinatesRepo {
  final CoordinatesLocalDS _coordinatesLocalDS;
  final CoordinatesRemoteDS _coordinatesRemoteDS;

  CoordinatesRepoImpl(
    this._coordinatesLocalDS,
    this._coordinatesRemoteDS,
  ) {
    addCurrentPositionToRemoteAndLocal();
  }

  DateTime? _lastPositionUpdate;

  @override
  Future<void> addCurrentPositionToRemoteAndLocal() async {
    final currentPoint = await _extractCurrentPositionFromGeolocator();
    _coordinatesLocalDS.addPosition(currentPoint);

    if (_lastPositionUpdate != null) {
      final now = DateTime.now();
      final diff = now.difference(_lastPositionUpdate!);
      if (diff.inMinutes < 5) {
        return;
      } else {
        _coordinatesRemoteDS.addPosition(currentPoint);
        _lastPositionUpdate = now;
      }
    }
  }

  Future<PointModel> _extractCurrentPositionFromGeolocator() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      final currentPosition = await Geolocator.getCurrentPosition();
      final currentPoint = PointModel(
        lat: currentPosition.latitude,
        long: currentPosition.longitude,
      );
      return currentPoint;
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
  PointModel? getLatestPositionFromLocal() {
    return _coordinatesLocalDS.getPosition();
  }

  @override
  Future<void> deleteLocalPositionFromLocal() {
    return _coordinatesLocalDS.deletePosition();
  }
}
