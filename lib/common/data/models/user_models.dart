import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
// class FullUserModel with _$FullUserModel {
//   const FullUserModel._();

//   const factory FullUserModel({
//     required String id,
//     required String nickname,
//     required List<String> photos,
//     required UserConnectStatusEnum connectStatus,
//     required List<String> interests,
//     required DateTime birthDate,
//     String? description,
//     String? lookingFor,
//     String? instagramUsername,
//     String? telegramUsername,
//   }) = _FullUserModel;

//   factory FullUserModel.fromJson(Map<String, dynamic> json) =>
//       _$FullUserModelFromJson(json);
// }

class FullUserModel with _$FullUserModel {
  const FullUserModel._();

  const factory FullUserModel({
    required ShortUserModel shortUserModel,
    required AdditionalUserModel additionalUserModel,
    required PrivateInfoUserModel privateInfoUserModel,
  }) = _FullUserModel;
}

@freezed
class PrivateInfoUserModel with _$PrivateInfoUserModel {
  const PrivateInfoUserModel._();

  const factory PrivateInfoUserModel({
    String? instagramUsername,
    String? telegramUsername,
  }) = _PrivateInfoUserModel;

  factory PrivateInfoUserModel.fromJson(Map<String, dynamic> json) =>
      _$PrivateInfoUserModelFromJson(json);
}

@freezed
class AdditionalUserModel with _$AdditionalUserModel {
  const AdditionalUserModel._();

  const factory AdditionalUserModel({
    required String id,
    String? description,
    String? lookingFor,
  }) = _AdditionalUserModel;

  factory AdditionalUserModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalUserModelFromJson(json);
}

@freezed
class ShortUserModel with _$ShortUserModel {
  const ShortUserModel._();

  const factory ShortUserModel({
    required String id,
    required String nickname,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> commonInterests,
  }) = _ShortUserModel;

  factory ShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$ShortUserModelFromJson(json);
}
