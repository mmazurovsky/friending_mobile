import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../assets/assets.dart';
import '../../service/open_link_service.dart';
import '../entities/tag_entity.dart';
import '../entities/user_entities.dart';
import '../enums.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@Freezed()
class FullReadUserModel with _$FullReadUserModel {
  const FullReadUserModel._();

  const factory FullReadUserModel({
    required ShortReadUserModel shortUserModel,
    // required AdditionalUserModel additionalUserModel,
    required SecureUserInfoModel secureUserInfoModel,
    // required ShortReadUserModel? pairedWith,
  }) = _FullReadUserModel;
}

@freezed
class OtherUserFullModel with _$OtherUserFullModel {
  const OtherUserFullModel._();

  const factory OtherUserFullModel({
    required ShortReadUserModel shortUserModel,
    // required AdditionalUserModel additionalUserModel,
    required SecureUserInfoModel secureUserInfoModel,
    required UserPairStatusEnum connectStatusEnum,
    required ShortReadUserModel? pairedWith,
  }) = _OtherUserFullModel;
}

enum SecureFieldStatusEnum {
  private,
  public,
}

@freezed
class SecureUserInfoFieldModel with _$SecureUserInfoFieldModel {
  const SecureUserInfoFieldModel._();

  const factory SecureUserInfoFieldModel({
    required String title,
    required String value,
    required SecureFieldStatusEnum state,
    required int order,
  }) = _SecureUserInfoFieldModel;

  factory SecureUserInfoFieldModel.fromJson(Map<String, dynamic> json) => _$SecureUserInfoFieldModelFromJson(json);

  VoidCallback get onTap => () {
        if (title == 'Instagram') {
          OpenLinkService.openInstagram(value);
        } else if (title == 'Telegram') {
          OpenLinkService.openTelegram(value);
        } else if (title == 'WhatsApp') {
          OpenLinkService.openWhatsapp(value);
        } else {
          throw Exception("Can't open link for unknown social network");
        }
      };

  String get logoAsset {
    if (title == 'Instagram') {
      return ImageAssets.instagramLogo;
    } else if (title == 'Telegram') {
      return ImageAssets.telegramLogo;
    } else if (title == 'WhatsApp') {
      return ImageAssets.whatsappLogo;
    } else {
      throw Exception("Can't find logo for unknown social network");
    }
  }
}

@freezed
class SecureUserInfoModel with _$SecureUserInfoModel {
  const SecureUserInfoModel._();

  factory SecureUserInfoModel.empty() => const SecureUserInfoModel([]);

  const factory SecureUserInfoModel(
    List<SecureUserInfoFieldModel> fields,
  ) = _SecureUserInfoModel;

  factory SecureUserInfoModel.fromJson(Map<String, dynamic> json) => _$SecureUserInfoModelFromJson(json);
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
    required String about,
    required String lookingFor,
  }) = _ShortCreateUserModel;

  //TODO!: check this
  int get soulsCount => 0;

  @JsonKey(includeFromJson: false, includeToJson: false)
  ShortUpdateUserModel get toUpdateShortModel {
    return ShortUpdateUserModel(
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
      about: about,
      lookingFor: lookingFor,
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
    required String about,
    required String lookingFor,
  }) = _ShortUpdateUserModel;

  factory ShortUpdateUserModel.fromJson(Map<String, dynamic> json) => _$ShortUpdateUserModelFromJson(json);

  ShortCreateUserModel toCreateShortModel(String id) {
    return ShortCreateUserModel(
      id: id,
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
      createdDateTime: DateTime.now(),
      about: about,
      lookingFor: lookingFor,
    );
  }
}

@Freezed(toJson: false)
class ShortReadUserModel with _$ShortReadUserModel implements ShortReadUserEntity {
  const ShortReadUserModel._();

  factory ShortReadUserModel.emptyUser(String id) => ShortReadUserModel(
        id: id,
        username: 'empty',
        photos: [],
        birthDate: DateTime.now(),
        tags: [],
        about: '',
        lookingFor: '',
      );

  bool get isEmptyProfile {
    return (username == 'empty') && photos.isEmpty && tags.isEmpty && about.isEmpty && lookingFor.isEmpty;
  }

  const factory ShortReadUserModel({
    required String id,
    required String username,
    required List<String> photos,
    required DateTime birthDate,
    required List<String> tags,
    required String about,
    required String lookingFor,
    //*INFO: this gets filled later
    @Default([]) List<String> commonTags,
  }) = _ShortReadUserModel;

  factory ShortReadUserModel.fromJson(Map<String, dynamic> json) => _$ShortReadUserModelFromJson(json);

  List<TagEntity> get tagsEntities {
    final commonTagsEntities = commonTags
        .map((e) => TagEntity(
              e,
              true,
            ))
        .toList();

    final nonCommonTagsEntities = tags
        .where((element) => !commonTags.contains(element))
        .map((e) => TagEntity(
              e,
            ))
        .toList();

    return [...commonTagsEntities, ...nonCommonTagsEntities];
  }

  @override
  String get avatar => photos.first;

  ShortUpdateUserModel get convertToUpdateModel {
    return ShortUpdateUserModel(
      username: username,
      birthDate: birthDate,
      photos: photos,
      tags: tags,
      about: about,
      lookingFor: lookingFor,
    );
  }

  @override
  int get age {
    final now = DateTime.now();
    final ageWillBeAtEndOfCurrentYear = now.year - birthDate.year;
    final isBeforeBirthday = now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day);
    return isBeforeBirthday ? ageWillBeAtEndOfCurrentYear - 1 : ageWillBeAtEndOfCurrentYear;
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

  factory VeryShortUserModel.fromJson(Map<String, dynamic> json) => _$VeryShortUserModelFromJson(json);
}
