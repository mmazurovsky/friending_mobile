import 'package:hive/hive.dart';

import '../../../common/data/models/point_model.dart';

abstract class CoordinatesLocalDS {
  Future<void> addPosition(PointModel coordinate);

  PointModel? getPosition();
}

class CoordinatesLocalDSImpl implements CoordinatesLocalDS {
  static const _coordinatesBox = 'coordinates';
  @override
  Future<void> addPosition(PointModel coordinate) async {
    final box = Hive.box(_coordinatesBox);
    await box.put('latest', coordinate.toJson());
  }

  @override
  PointModel? getPosition() {
    final box = Hive.box(_coordinatesBox);
    final coordinateRaw = box.get('latest');
    if (coordinateRaw == null) {
      return null;
    } else {
      return PointModel.fromJson(coordinateRaw);
    }
  }
}
