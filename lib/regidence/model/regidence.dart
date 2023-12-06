import 'package:freezed_annotation/freezed_annotation.dart';

part 'regidence.freezed.dart';
part 'regidence.g.dart';

@freezed
class Regidence with _$Regidence {
  factory Regidence({
    required List<String> imagePath,
    required String buildingNamePath,
    required String roomPrice,
    required String nearStation,
    required String roomSize,
    required String buildingSize,
  }) = _Regidence;

  factory Regidence.fromJson(Map<String, dynamic> json) =>
      _$RegidenceFromJson(json);
}
