// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regidence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Regidence _$RegidenceFromJson(Map<String, dynamic> json) {
  return _Regidence.fromJson(json);
}

/// @nodoc
mixin _$Regidence {
  List<String> get imagePath => throw _privateConstructorUsedError;
  String get buildingNamePath => throw _privateConstructorUsedError;
  String get roomPrice => throw _privateConstructorUsedError;
  String get nearStation => throw _privateConstructorUsedError;
  String get roomSize => throw _privateConstructorUsedError;
  String get buildingSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegidenceCopyWith<Regidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegidenceCopyWith<$Res> {
  factory $RegidenceCopyWith(Regidence value, $Res Function(Regidence) then) =
      _$RegidenceCopyWithImpl<$Res, Regidence>;
  @useResult
  $Res call(
      {List<String> imagePath,
      String buildingNamePath,
      String roomPrice,
      String nearStation,
      String roomSize,
      String buildingSize});
}

/// @nodoc
class _$RegidenceCopyWithImpl<$Res, $Val extends Regidence>
    implements $RegidenceCopyWith<$Res> {
  _$RegidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? buildingNamePath = null,
    Object? roomPrice = null,
    Object? nearStation = null,
    Object? roomSize = null,
    Object? buildingSize = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buildingNamePath: null == buildingNamePath
          ? _value.buildingNamePath
          : buildingNamePath // ignore: cast_nullable_to_non_nullable
              as String,
      roomPrice: null == roomPrice
          ? _value.roomPrice
          : roomPrice // ignore: cast_nullable_to_non_nullable
              as String,
      nearStation: null == nearStation
          ? _value.nearStation
          : nearStation // ignore: cast_nullable_to_non_nullable
              as String,
      roomSize: null == roomSize
          ? _value.roomSize
          : roomSize // ignore: cast_nullable_to_non_nullable
              as String,
      buildingSize: null == buildingSize
          ? _value.buildingSize
          : buildingSize // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegidenceImplCopyWith<$Res>
    implements $RegidenceCopyWith<$Res> {
  factory _$$RegidenceImplCopyWith(
          _$RegidenceImpl value, $Res Function(_$RegidenceImpl) then) =
      __$$RegidenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> imagePath,
      String buildingNamePath,
      String roomPrice,
      String nearStation,
      String roomSize,
      String buildingSize});
}

/// @nodoc
class __$$RegidenceImplCopyWithImpl<$Res>
    extends _$RegidenceCopyWithImpl<$Res, _$RegidenceImpl>
    implements _$$RegidenceImplCopyWith<$Res> {
  __$$RegidenceImplCopyWithImpl(
      _$RegidenceImpl _value, $Res Function(_$RegidenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? buildingNamePath = null,
    Object? roomPrice = null,
    Object? nearStation = null,
    Object? roomSize = null,
    Object? buildingSize = null,
  }) {
    return _then(_$RegidenceImpl(
      imagePath: null == imagePath
          ? _value._imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buildingNamePath: null == buildingNamePath
          ? _value.buildingNamePath
          : buildingNamePath // ignore: cast_nullable_to_non_nullable
              as String,
      roomPrice: null == roomPrice
          ? _value.roomPrice
          : roomPrice // ignore: cast_nullable_to_non_nullable
              as String,
      nearStation: null == nearStation
          ? _value.nearStation
          : nearStation // ignore: cast_nullable_to_non_nullable
              as String,
      roomSize: null == roomSize
          ? _value.roomSize
          : roomSize // ignore: cast_nullable_to_non_nullable
              as String,
      buildingSize: null == buildingSize
          ? _value.buildingSize
          : buildingSize // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegidenceImpl implements _Regidence {
  _$RegidenceImpl(
      {required final List<String> imagePath,
      required this.buildingNamePath,
      required this.roomPrice,
      required this.nearStation,
      required this.roomSize,
      required this.buildingSize})
      : _imagePath = imagePath;

  factory _$RegidenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegidenceImplFromJson(json);

  final List<String> _imagePath;
  @override
  List<String> get imagePath {
    if (_imagePath is EqualUnmodifiableListView) return _imagePath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePath);
  }

  @override
  final String buildingNamePath;
  @override
  final String roomPrice;
  @override
  final String nearStation;
  @override
  final String roomSize;
  @override
  final String buildingSize;

  @override
  String toString() {
    return 'Regidence(imagePath: $imagePath, buildingNamePath: $buildingNamePath, roomPrice: $roomPrice, nearStation: $nearStation, roomSize: $roomSize, buildingSize: $buildingSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegidenceImpl &&
            const DeepCollectionEquality()
                .equals(other._imagePath, _imagePath) &&
            (identical(other.buildingNamePath, buildingNamePath) ||
                other.buildingNamePath == buildingNamePath) &&
            (identical(other.roomPrice, roomPrice) ||
                other.roomPrice == roomPrice) &&
            (identical(other.nearStation, nearStation) ||
                other.nearStation == nearStation) &&
            (identical(other.roomSize, roomSize) ||
                other.roomSize == roomSize) &&
            (identical(other.buildingSize, buildingSize) ||
                other.buildingSize == buildingSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imagePath),
      buildingNamePath,
      roomPrice,
      nearStation,
      roomSize,
      buildingSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegidenceImplCopyWith<_$RegidenceImpl> get copyWith =>
      __$$RegidenceImplCopyWithImpl<_$RegidenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegidenceImplToJson(
      this,
    );
  }
}

abstract class _Regidence implements Regidence {
  factory _Regidence(
      {required final List<String> imagePath,
      required final String buildingNamePath,
      required final String roomPrice,
      required final String nearStation,
      required final String roomSize,
      required final String buildingSize}) = _$RegidenceImpl;

  factory _Regidence.fromJson(Map<String, dynamic> json) =
      _$RegidenceImpl.fromJson;

  @override
  List<String> get imagePath;
  @override
  String get buildingNamePath;
  @override
  String get roomPrice;
  @override
  String get nearStation;
  @override
  String get roomSize;
  @override
  String get buildingSize;
  @override
  @JsonKey(ignore: true)
  _$$RegidenceImplCopyWith<_$RegidenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
