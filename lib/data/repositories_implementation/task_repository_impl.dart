import 'package:dartz/dartz.dart';
import 'package:kanban_test/data/datasource/task_time/task_time_ds.dart';
import 'package:kanban_test/data/datasource/tasks/tasks_ds.dart';
import 'package:kanban_test/data/models/task_time/task_time.dart';
import 'package:kanban_test/domain/models/task/task.dart' as model;
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskTimeDataSource localDataSource;

  TaskRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Exception, List<model.Task>>> getAllTasks() async {
    try {
      final List<model.Task> taskModels = await remoteDataSource.getAllTasks();
      return Right(taskModels);
    } catch (e) {
      print(e);
      return Left(Exception('Failed to load tasks'));
    }
  }

  @override
  Future<Either<Exception, model.Task>> addTask(model.Task task) async {
    try {
      final newTask = await remoteDataSource.addTask(task);
      return Right(newTask);
    } catch (e) {
      return Left(Exception('Failed to add task'));
    }
  }

  @override
  Future<Either<Exception, model.Task>> updateTask(model.Task task) async {
    try {
      final updatedTask = await remoteDataSource.updateTask(task);
      return Right(updatedTask);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, model.Task>> getTask(String taskId) async {
    try {
      final task = await remoteDataSource.getTask(taskId);
      return Right(task);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<TaskTime> startTimer(DateTime date, String taskId) {
    return localDataSource.startTimer(date, taskId);
  }

  @override
  Future<TaskTime> stopTimer(TaskTime taskTime) {
    return localDataSource.endTimer(taskTime);
  }

  @override
  Future<TaskTime?> getTaskTime(String taskId) {
    return localDataSource.getTaskTime(taskId);
  }
}
