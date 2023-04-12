import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/models/point_model.dart';

abstract class CoordinatesLocalDS {
  Future<void> addPosition(PointModel coordinate);

  PointModel? getPosition();

  Future<void> deletePosition();
}

@LazySingleton(as: CoordinatesLocalDS)
class CoordinatesLocalDSImpl implements CoordinatesLocalDS {
  @override
  Future<void> addPosition(PointModel coordinate) async {
    final box = Hive.box(Strings.ids.coordinatesBox);
    final json = coordinate.toJson();
    await box.put('latestPoint', json);
  }

  @override
  PointModel? getPosition() {
    final box = Hive.box(Strings.ids.coordinatesBox);
    final coordinateRaw = (box.get('latestPoint') as Map<dynamic, dynamic>?)
        ?.cast<String, dynamic>();
    if (coordinateRaw == null) {
      return null;
    } else {
      return PointModel.fromJson(coordinateRaw);
    }
  }

  @override
  Future<void> deletePosition() {
    final box = Hive.box(Strings.ids.coordinatesBox);
    return box.delete('latestPoint');
  }
}
