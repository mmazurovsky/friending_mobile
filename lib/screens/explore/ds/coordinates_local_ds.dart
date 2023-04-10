import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/models/point_model.dart';

abstract class CoordinatesLocalDS {
  Future<void> addPosition(PointModel coordinate);

  PointModel? getPosition();
}

@LazySingleton(as: CoordinatesLocalDS)
class CoordinatesLocalDSImpl implements CoordinatesLocalDS {
  @override
  Future<void> addPosition(PointModel coordinate) async {
    final box = Hive.box(Strings.ids.coordinatesBox);
    await box.put('latest', coordinate.toJson());
  }

  @override
  PointModel? getPosition() {
    final box = Hive.box(Strings.ids.coordinatesBox);
    final coordinateRaw = box.get('latest');
    if (coordinateRaw == null) {
      return null;
    } else {
      return PointModel.fromJson(coordinateRaw);
    }
  }
}
