import 'package:freezed_annotation/freezed_annotation.dart';

part 'qiita_article.freezed.dart';
part 'qiita_article.g.dart';

@freezed
class QiitaArticle with _$QiitaArticle {
  const factory QiitaArticle({
    required String id,
    required String title,
    required String url,
  }) = _QiitaArticle;

  factory QiitaArticle.fromJson(Map<String, dynamic> json) =>
      _$QiitaArticleFromJson(json);
}
