// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coordinate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoordinateModel _$$_CoordinateModelFromJson(Map<String, dynamic> json) =>
    _$_CoordinateModel(
      dateTime: DateTime.parse(json['dateTime'] as String),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_CoordinateModelToJson(_$_CoordinateModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'lat': instance.lat,
      'long': instance.long,
      'userId': instance.userId,
    };
