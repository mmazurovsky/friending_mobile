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
      isNew: json['isNew'] as bool,
      dateTime: DateTime.parse(json['dateTime'] as String),
      eventType: $enumDecode(_$UserEventTypeEnumEnumMap, json['eventType']),
    );

Map<String, dynamic> _$$_UserEventModelToJson(_$_UserEventModel instance) =>
    <String, dynamic>{
      'ownerUserId': instance.ownerUserId,
      'otherUser': instance.otherUser.toJson(),
      'isNew': instance.isNew,
      'dateTime': instance.dateTime.toIso8601String(),
      'eventType': _$UserEventTypeEnumEnumMap[instance.eventType]!,
    };

const _$UserEventTypeEnumEnumMap = {
  UserEventTypeEnum.connectRequestAwaitsApproval:
      'connectRequestAwaitsApproval',
  UserEventTypeEnum.connectRequestWasApproved: 'connectRequestWasApproved',
};
