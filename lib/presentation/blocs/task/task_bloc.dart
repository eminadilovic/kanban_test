import 'package:bloc/bloc.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:kanban_test/domain/repositories/task_repository.dart';
import 'package:kanban_test/service_locator.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>(_load);
  }

  final _repository = sl<TaskRepository>();

  _load(LoadTasks event, Emitter<TaskState> emit) async {
    if (state is TaskLoading || state is TaskLoaded) return;
    emit(TaskLoading());

    try {
      final response = await _repository.getAllTasks();
      response.fold((failure) => emit(TaskError(failure.toString())),
          (tasks) => emit(TaskLoaded(tasks)));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> addTask(Task task) async {
    try {
      final response = await _repository.addTask(task);
      response.fold(
        (failure) => emit(TaskError(failure.toString())),
        (newTask) {
          if (state is TaskLoaded) {
            final updatedTasks = List<Task>.from((state as TaskLoaded).tasks)
              ..add(newTask);
            emit(TaskLoaded(updatedTasks));
          } else {
            emit(TaskLoaded([newTask]));
          }
        },
      );
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final response = await _repository.updateTask(task);
      response.fold(
        (failure) => emit(TaskError(failure.toString())),
        (updatedTask) {
          if (state is TaskLoaded) {
            final updatedTasks = (state as TaskLoaded).tasks.map((t) {
              return t.id == updatedTask.id ? updatedTask : t;
            }).toList();
            emit(TaskLoaded(updatedTasks));
          } else {
            emit(TaskLoaded([updatedTask]));
          }
        },
      );
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
