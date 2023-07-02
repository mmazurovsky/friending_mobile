// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecureUserInfoFieldModel _$$_SecureUserInfoFieldModelFromJson(
        Map<String, dynamic> json) =>
    _$_SecureUserInfoFieldModel(
      title: json['title'] as String,
      value: json['value'] as String,
      state: $enumDecode(_$PrivateFieldEnumEnumMap, json['state']),
      order: json['order'] as int,
    );

Map<String, dynamic> _$$_SecureUserInfoFieldModelToJson(
        _$_SecureUserInfoFieldModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'state': _$PrivateFieldEnumEnumMap[instance.state]!,
      'order': instance.order,
    };

const _$PrivateFieldEnumEnumMap = {
  SecureFieldStatusEnum.private: 'private',
  SecureFieldStatusEnum.public: 'public',
};

_$_SecureUserInfoModel _$$_SecureUserInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_SecureUserInfoModel(
      (json['fields'] as List<dynamic>)
          .map((e) =>
              SecureUserInfoFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SecureUserInfoModelToJson(
        _$_SecureUserInfoModel instance) =>
    <String, dynamic>{
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

Map<String, dynamic> _$$_ShortCreateUserModelToJson(
        _$_ShortCreateUserModel instance) =>
    <String, dynamic>{
      'soulsCount': instance.soulsCount,
      'id': instance.id,
      'username': instance.username,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'tags': instance.tags,
      'about': instance.about,
      'lookingFor': instance.lookingFor,
    };

_$_ShortUpdateUserModel _$$_ShortUpdateUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_ShortUpdateUserModel(
      username: json['username'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      about: json['about'] as String,
      lookingFor: json['lookingFor'] as String,
    );

Map<String, dynamic> _$$_ShortUpdateUserModelToJson(
        _$_ShortUpdateUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'tags': instance.tags,
      'about': instance.about,
      'lookingFor': instance.lookingFor,
    };

_$_ShortReadUserModel _$$_ShortReadUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_ShortReadUserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      about: json['about'] as String,
      lookingFor: json['lookingFor'] as String,
      commonTags: (json['commonTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

_$_VeryShortUserModel _$$_VeryShortUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_VeryShortUserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_VeryShortUserModelToJson(
        _$_VeryShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'photo': instance.photo,
    };
