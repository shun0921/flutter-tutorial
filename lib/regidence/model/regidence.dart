import 'package:json_annotation/json_annotation.dart';

part 'regidence.g.dart';

@JsonSerializable()
class Regidence {
  List<String> imagePath;
  String buildingNamePath;
  String roomPrice;
  String nearStation;
  String roomSize;
  String buildingSize;

  Regidence(
      {required this.imagePath,
      required this.buildingNamePath,
      required this.roomPrice,
      required this.nearStation,
      required this.roomSize,
      required this.buildingSize});

  factory Regidence.fromJson(Map<String, dynamic> json) =>
      _$RegidenceFromJson(json);
  Map<String, dynamic> toJson() => _$RegidenceToJson(this);
}
