// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_state.freezed.dart'; // freezedによって生成されるファイルへの参照
part 'article_state.g.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<Article>[]) List<Article> articles,
    @Default('') String currentTag,
  }) = _ArticleState;
}

@freezed
abstract class Article with _$Article {
  const factory Article({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'user') User? user,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
