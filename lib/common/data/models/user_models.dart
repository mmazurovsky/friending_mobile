import 'package:flutter_mobile_starter/common/data/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class FullUserModel with _$FullUserModel {
  const FullUserModel._();

  const factory FullUserModel({
    required String id,
    required String nickname,
    required List<String> photos,
    required UserConnectStatusEnum connectStatus,
    required List<UserGoalsEnum> goals,
    required List<String> interests,
    required DateTime birthDate,
    String? description,
    String? instagramUsername,
    String? telegramUsername,

  }) = _FullUserModel;

  factory FullUserModel.fromJson(Map<String, dynamic> json) =>
      _$FullUserModelFromJson(json);
}
