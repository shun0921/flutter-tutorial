// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      imagePath: json['imagePath'] as String,
      iconPath: json['iconPath'] as String,
      title: json['title'] as String,
      channelName: json['channelName'] as String,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'iconPath': instance.iconPath,
      'title': instance.title,
      'channelName': instance.channelName,
    };
