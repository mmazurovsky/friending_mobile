// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEventModel _$$_UserEventModelFromJson(Map<String, dynamic> json) =>
    _$_UserEventModel(
      ownerUserId: json['ownerUserId'] as String,
      otherUser: VeryShortUserModel.fromJson(
          json['otherUser'] as Map<String, dynamic>),
      isNotSeen: json['isNotSeen'] as bool,
      dateTime: DateTime.parse(json['dateTime'] as String),
      eventType: $enumDecode(_$UserEventTypeEnumEnumMap, json['eventType']),
    );

Map<String, dynamic> _$$_UserEventModelToJson(_$_UserEventModel instance) =>
    <String, dynamic>{
      'ownerUserId': instance.ownerUserId,
      'otherUser': instance.otherUser.toJson(),
      'isNotSeen': instance.isNotSeen,
      'dateTime': instance.dateTime.toIso8601String(),
      'eventType': _$UserEventTypeEnumEnumMap[instance.eventType]!,
    };

const _$UserEventTypeEnumEnumMap = {
  UserEventTypeEnum.connectRequestAwaitsApproval:
      'connectRequestAwaitsApproval',
  UserEventTypeEnum.connectRequestWasApproved: 'connectRequestWasApproved',
};

_$_AppOpenedEventModel _$$_AppOpenedEventModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppOpenedEventModel(
      userId: json['userId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_AppOpenedEventModelToJson(
        _$_AppOpenedEventModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dateTime': instance.dateTime.toIso8601String(),
    };
