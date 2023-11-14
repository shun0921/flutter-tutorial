// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qiita_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QiitaArticle _$QiitaArticleFromJson(Map<String, dynamic> json) {
  return _QiitaArticle.fromJson(json);
}

/// @nodoc
mixin _$QiitaArticle {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QiitaArticleCopyWith<QiitaArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaArticleCopyWith<$Res> {
  factory $QiitaArticleCopyWith(
          QiitaArticle value, $Res Function(QiitaArticle) then) =
      _$QiitaArticleCopyWithImpl<$Res, QiitaArticle>;
  @useResult
  $Res call({String id, String title, String url});
}

/// @nodoc
class _$QiitaArticleCopyWithImpl<$Res, $Val extends QiitaArticle>
    implements $QiitaArticleCopyWith<$Res> {
  _$QiitaArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QiitaArticleImplCopyWith<$Res>
    implements $QiitaArticleCopyWith<$Res> {
  factory _$$QiitaArticleImplCopyWith(
          _$QiitaArticleImpl value, $Res Function(_$QiitaArticleImpl) then) =
      __$$QiitaArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String url});
}

/// @nodoc
class __$$QiitaArticleImplCopyWithImpl<$Res>
    extends _$QiitaArticleCopyWithImpl<$Res, _$QiitaArticleImpl>
    implements _$$QiitaArticleImplCopyWith<$Res> {
  __$$QiitaArticleImplCopyWithImpl(
      _$QiitaArticleImpl _value, $Res Function(_$QiitaArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$QiitaArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QiitaArticleImpl implements _QiitaArticle {
  const _$QiitaArticleImpl(
      {required this.id, required this.title, required this.url});

  factory _$QiitaArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$QiitaArticleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'QiitaArticle(id: $id, title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QiitaArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QiitaArticleImplCopyWith<_$QiitaArticleImpl> get copyWith =>
      __$$QiitaArticleImplCopyWithImpl<_$QiitaArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QiitaArticleImplToJson(
      this,
    );
  }
}

abstract class _QiitaArticle implements QiitaArticle {
  const factory _QiitaArticle(
      {required final String id,
      required final String title,
      required final String url}) = _$QiitaArticleImpl;

  factory _QiitaArticle.fromJson(Map<String, dynamic> json) =
      _$QiitaArticleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$QiitaArticleImplCopyWith<_$QiitaArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
