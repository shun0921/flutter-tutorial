import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String imageUrl;
  final String title;
  final String price;
  final String watch;

  Item({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.watch,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
