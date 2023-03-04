// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullUserModel _$$_FullUserModelFromJson(Map<String, dynamic> json) =>
    _$_FullUserModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      connectStatus:
          $enumDecode(_$UserConnectStatusEnumEnumMap, json['connectStatus']),
      goals: (json['goals'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserGoalsEnumEnumMap, e))
          .toList(),
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FullUserModelToJson(_$_FullUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photos': instance.photos,
      'connectStatus': _$UserConnectStatusEnumEnumMap[instance.connectStatus]!,
      'goals': instance.goals.map((e) => _$UserGoalsEnumEnumMap[e]!).toList(),
      'interests': instance.interests,
    };

const _$UserConnectStatusEnumEnumMap = {
  UserConnectStatusEnum.connected: 'connected',
  UserConnectStatusEnum.disconnected: 'disconnected',
  UserConnectStatusEnum.requested: 'requested',
  UserConnectStatusEnum.toBeApproved: 'toBeApproved',
};

const _$UserGoalsEnumEnumMap = {
  UserGoalsEnum.findFriends: 'findFriends',
  UserGoalsEnum.dating: 'dating',
  UserGoalsEnum.hookup: 'hookup',
  UserGoalsEnum.other: 'other',
};
