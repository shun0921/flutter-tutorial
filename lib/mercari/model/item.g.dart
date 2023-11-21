// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      watch: json['watch'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'price': instance.price,
      'watch': instance.watch,
    };
