import 'package:dartz/dartz.dart';
import 'package:kanban_test/data/models/task_time/task_time.dart';
import 'package:kanban_test/domain/models/task/task.dart' as model;

abstract class TaskRepository {
  Future<Either<Exception, List<model.Task>>> getAllTasks();
  Future<Either<Exception, model.Task>> addTask(model.Task task);
  Future<Either<Exception, model.Task>> updateTask(model.Task task);
  Future<Either<Exception, model.Task>> getTask(String taskId);
  Future<TaskTime> startTimer(
    DateTime date,
    String taskId,
  );
  Future<TaskTime> stopTimer(TaskTime taskTime);
  Future<TaskTime?> getTaskTime(String taskId);
}
