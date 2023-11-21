import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String imagePath;
  final String iconPath;
  final String title;
  final String channelName;

  Movie(
      {required this.imagePath,
      required this.iconPath,
      required this.title,
      required this.channelName});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
