// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegidenceImpl _$$RegidenceImplFromJson(Map<String, dynamic> json) =>
    _$RegidenceImpl(
      imagePath:
          (json['imagePath'] as List<dynamic>).map((e) => e as String).toList(),
      buildingNamePath: json['buildingNamePath'] as String,
      roomPrice: json['roomPrice'] as String,
      nearStation: json['nearStation'] as String,
      roomSize: json['roomSize'] as String,
      buildingSize: json['buildingSize'] as String,
    );

Map<String, dynamic> _$$RegidenceImplToJson(_$RegidenceImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'buildingNamePath': instance.buildingNamePath,
      'roomPrice': instance.roomPrice,
      'nearStation': instance.nearStation,
      'roomSize': instance.roomSize,
      'buildingSize': instance.buildingSize,
    };
