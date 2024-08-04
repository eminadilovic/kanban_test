import 'package:dio/dio.dart';
import 'package:kanban_test/core/utils/http_client.dart';
import 'package:kanban_test/domain/models/task/task.dart' as model;

abstract class TaskRemoteDataSource {
  Future<List<model.Task>> getAllTasks();
  Future<model.Task> addTask(model.Task task);
  Future<model.Task> updateTask(model.Task task);
  Future<model.Task> getTask(String taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  TaskRemoteDataSourceImpl();

  @override
  Future<List<model.Task>> getAllTasks() async {
    try {
      Response? response = await Http.getDio()?.get('rest/v2/tasks');

      if (response?.statusCode == 200) {
        final List<dynamic> jsonData = response?.data as List<dynamic>;
        final List<model.Task> tasks = jsonData
            .map((dynamic item) =>
                model.Task.fromJson(item as Map<String, dynamic>))
            .toList();
        return tasks;
      } else {
        throw Exception('Failed to load tasks');
      }
    } on DioException catch (e) {
      print(e);
      if (e.response != null) {
        return [];
      }
    }
    return [];
  }

  @override
  Future<model.Task> addTask(model.Task task) async {
    final response =
        await Http.getDio()?.post('rest/v2/tasks', data: task.toJson());
    return model.Task.fromJson(response?.data);
  }

  @override
  Future<model.Task> updateTask(model.Task task) async {
    print('before');
    print(task.toJson());
    final response = await Http.getDio()
        ?.post('/rest/v2/tasks/${task.id}', data: task.toJson());
    if (response?.statusCode == 200) {
      print(response?.data);
      return model.Task.fromJson(response?.data);
    } else {
      throw Exception('Failed to update task');
    }
  }

  @override
  Future<model.Task> getTask(String taskId) async {
    final response = await Http.getDio()?.get('/rest/v2/tasks/${taskId}');
    if (response?.statusCode == 200) {
      return model.Task.fromJson(response?.data);
    } else {
      throw Exception('Failed to update task');
    }
  }
}
