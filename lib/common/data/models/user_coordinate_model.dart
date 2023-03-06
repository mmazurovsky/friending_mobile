import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_coordinate_model.freezed.dart';
part 'user_coordinate_model.g.dart';

@freezed
class UserCoordinateModel with _$UserCoordinateModel {
  const UserCoordinateModel._();

  const factory UserCoordinateModel({
    required DateTime dateTime,
    required double lat,
    required double long,
    required String userId,
  }) = _CoordinateModel;

  factory UserCoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$UserCoordinateModelFromJson(json);
}
