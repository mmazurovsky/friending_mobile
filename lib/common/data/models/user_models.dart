import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/user_entities.dart';
import '../enums.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class FullUserModel with _$FullUserModel {
  const FullUserModel._();

  const factory FullUserModel({
    required ShortUserModel shortUserModel,
    required AdditionalUserModel additionalUserModel,
    required PrivateInfoUserModel privateInfoUserModel,
  }) = _FullUserModel;
}

@freezed
class OtherUserFullModel with _$OtherUserFullModel {
  const OtherUserFullModel._();

  const factory OtherUserFullModel({
    required ShortUserModel shortUserModel,
    required AdditionalUserModel additionalUserModel,
    required PrivateInfoUserModel? privateInfoUserModel,
    required UserConnectStatusEnum connectStatusEnum,
  }) = _OtherUserFullModel;
}

@freezed
class FullUserWriteModel with _$FullUserWriteModel {
  const FullUserWriteModel._();

  const factory FullUserWriteModel({
    required ShortUserWriteModel shortUserWriteModel,
    required AdditionalUserWriteModel additionalUserWriteModel,
    required PrivateInfoUserModel privateInfoUserModel,
  }) = _FullUserWriteModel;
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
    // required String id,
    String? description,
    String? lookingFor,
  }) = _AdditionalUserModel;

  factory AdditionalUserModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalUserModelFromJson(json);
}

@freezed
class ShortUserModel with _$ShortUserModel implements ShortUserEntity {
  const ShortUserModel._();

  const factory ShortUserModel({
    required String id,
    required String nickname,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> tags,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default(<String>[])
        List<String> commonTags,
    required int soulsCount,
  }) = _ShortUserModel;

  factory ShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$ShortUserModelFromJson(json);

  @override
  String get avatar => photos.first;
}

@freezed
class VeryShortUserModel with _$VeryShortUserModel {
  const VeryShortUserModel._();

  const factory VeryShortUserModel({
    required String id,
    required String nickname,
    required String photo,
  }) = _VeryShortUserModel;

  factory VeryShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$VeryShortUserModelFromJson(json);
}

@freezed
class ShortUserWriteModel with _$ShortUserWriteModel {
  const ShortUserWriteModel._();

  const factory ShortUserWriteModel({
    required String nickname,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> tags,
    @JsonKey(includeIfNull: false) int? soulsCount,
  }) = _ShortUserWriteModel;

  factory ShortUserWriteModel.fromJson(Map<String, dynamic> json) =>
      _$ShortUserWriteModelFromJson(json);
}

@freezed
class AdditionalUserWriteModel with _$AdditionalUserWriteModel {
  const AdditionalUserWriteModel._();

  const factory AdditionalUserWriteModel({
    String? description,
    String? lookingFor,
  }) = _AdditionalUserWriteModel;

  factory AdditionalUserWriteModel.fromJson(Map<String, dynamic> json) =>
      _$AdditionalUserWriteModelFromJson(json);
}
