import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_test/domain/models/due/due.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    num? priority,
    required String content,
    String? description,
    required bool? is_completed,
    required int? comment_count,
    required DateTime? created_at,
    int? duration,
    Due? due,
    String? duration_unit,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
