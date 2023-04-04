import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_model.freezed.dart';
part 'point_model.g.dart';

@freezed
class PointModel with _$PointModel {
  const PointModel._();

  const factory PointModel({
    required double lat,
    required double long,
  }) = _PointModel;

  factory PointModel.fromJson(Map<String, dynamic> json) =>
      _$PointModelFromJson(json);
}
