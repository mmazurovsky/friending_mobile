import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate_model.freezed.dart';
part 'coordinate_model.g.dart';

@freezed
class CoordinateModel with _$CoordinateModel {
  const CoordinateModel._();

  const factory CoordinateModel({
    required DateTime dateTime,
    required double lat,
    required double long,
    required String userId,
  }) = _CoordinateModel;

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);
}
