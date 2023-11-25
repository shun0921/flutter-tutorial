import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  const factory TodoModel({
    required int id,
    required String title,
    required String subtitle,
    required String date,
    required DateTime createdDate,
  }) = _TodoModel;
}
