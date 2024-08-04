import 'package:hive/hive.dart';

part 'task_time.g.dart';

@HiveType(typeId: 0)
class TaskTime extends HiveObject {
  @HiveField(0)
  final String taskId;

  @HiveField(1)
  final DateTime startTime;

  @HiveField(2)
  final DateTime? endTime;

  TaskTime({
    required this.taskId,
    required this.startTime,
    required this.endTime,
  });
}
