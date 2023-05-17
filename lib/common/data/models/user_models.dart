import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/user_entities.dart';
import '../enums.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@Freezed()
class FullReadUserModel with _$FullReadUserModel {
  const FullReadUserModel._();

  const factory FullReadUserModel({
    required ShortReadUserModel shortUserModel,
    required AdditionalUserModel additionalUserModel,
    required PrivateInfoUserModel privateInfoUserModel,
  }) = _FullReadUserModel;
}

@freezed
class OtherUserFullModel with _$OtherUserFullModel {
  const OtherUserFullModel._();

  const factory OtherUserFullModel({
    required ShortReadUserModel shortUserModel,
    required AdditionalUserModel additionalUserModel,
    required PrivateInfoUserModel? privateInfoUserModel,
    required UserConnectStatusEnum connectStatusEnum,
  }) = _OtherUserFullModel;
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

@Freezed(toJson: true)
class ShortCreateUserModel with _$ShortCreateUserModel {
  const ShortCreateUserModel._();

  const factory ShortCreateUserModel({
    required String id,
    required String username,
    required List<String> photos,
    required DateTime birthDate,
    required DateTime createdDateTime,
    required List<String> tags,
  }) = _ShortCreateUserModel;

  //TODO!: check this
  int get soulsCount => 0;

  ShortUpdateUserModel get toUpdateShortModel {
    return ShortUpdateUserModel(
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
    );
  }
}

@Freezed(toJson: true)
class ShortUpdateUserModel with _$ShortUpdateUserModel {
  const ShortUpdateUserModel._();

  const factory ShortUpdateUserModel({
    required String username,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> tags,
  }) = _ShortUpdateUserModel;

  factory ShortUpdateUserModel.fromJson(Map<String, dynamic> json) =>
      _$ShortUpdateUserModelFromJson(json);

  ShortCreateUserModel toCreateShortModel(String id) {
    return ShortCreateUserModel(
      id: id,
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
      createdDateTime: DateTime.now(),
    );
  }
}

@Freezed(toJson: false)
class ShortReadUserModel
    with _$ShortReadUserModel
    implements ShortReadUserEntity {
  const ShortReadUserModel._();

  const factory ShortReadUserModel({
    required String id,
    required String username,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> tags,
    //*INFO: this gets filled later
    @Default([]) List<String> commonTags,
  }) = _ShortReadUserModel;

  factory ShortReadUserModel.fromJson(Map<String, dynamic> json) =>
      _$ShortReadUserModelFromJson(json);

  @override
  String get avatar => photos.first;

  ShortUpdateUserModel get convertToUpdateModel {
    return ShortUpdateUserModel(
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
    );
  }
}

@freezed
class VeryShortUserModel with _$VeryShortUserModel {
  const VeryShortUserModel._();

  const factory VeryShortUserModel({
    required String id,
    required String username,
    required String photo,
  }) = _VeryShortUserModel;

  factory VeryShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$VeryShortUserModelFromJson(json);
}
