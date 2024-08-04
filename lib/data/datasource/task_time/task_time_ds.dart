import 'package:hive/hive.dart';
import 'package:kanban_test/core/utils/hive_service.dart';
import 'package:kanban_test/data/models/task_time/task_time.dart';

abstract class TaskTimeDataSource {
  Future<TaskTime> startTimer(DateTime date, String taskId);
  Future<TaskTime> endTimer(TaskTime taskTime);
  Future<TaskTime?> getTaskTime(String taskId);
}

class TaskTimeDataSourceImpl implements TaskTimeDataSource {
  Box<TaskTime> get box => Hive.box<TaskTime>(HiveService.taskTimeBox);

  @override
  Future<TaskTime> startTimer(
    DateTime date,
    String taskId,
  ) async {
    final timeEntry = TaskTime(
      taskId: taskId,
      startTime: date,
      endTime: null,
    );
    await box.add(timeEntry);
    return timeEntry;
  }

  @override
  Future<TaskTime> endTimer(TaskTime taskTime) async {
    final box = Hive.box<TaskTime>(HiveService.taskTimeBox);
    final key = box.keys.cast<int>().firstWhere(
        (k) => box.get(k)!.taskId == taskTime.taskId,
        orElse: () => throw Exception('Task not found'));
    TaskTime updatedTaskTime = TaskTime(
      taskId: taskTime.taskId,
      startTime: taskTime.startTime,
      endTime: DateTime.now(),
    );

    await box.put(key, updatedTaskTime);
    return updatedTaskTime;
  }

  @override
  Future<TaskTime?> getTaskTime(String taskId) async {
    try {
      return box.values.firstWhere((taskTime) => taskTime.taskId == taskId);
    } catch (e) {
      return null;
    }
  }
}
