import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/core/utils/notification_service.dart';
import 'package:kanban_test/data/models/task_time/task_time.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';
import 'package:kanban_test/domain/repositories/comment_repository.dart';
import 'package:kanban_test/domain/repositories/task_repository.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';
import 'package:kanban_test/service_locator.dart';
import 'task_details_event.dart';
import 'task_details_state.dart';

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  TaskDetailsBloc() : super(TaskDetailsInitial()) {
    on<LoadTaskDetails>(_load);
    on<StartTimerEvent>(_onStartTimerEvent);
    on<StopTimerEvent>(_onStopTimerEvent);
  }

  final _commentsRepository = sl<CommentRepository>();
  final _taskRepository = sl<TaskRepository>();

  Future<void> _load(
      LoadTaskDetails event, Emitter<TaskDetailsState> emit) async {
    if (state is TaskDetailsLoading) return;
    emit(TaskDetailsLoading());

    try {
      final taskResult = await _taskRepository.getTask(event.taskId);
      final commentsResult =
          await _commentsRepository.getComments(event.taskId);

      final taskTimeResult = await _taskRepository.getTaskTime(event.taskId);

      final startTime =
          taskTimeResult == null ? null : taskTimeResult.startTime;
      final endTime = taskTimeResult == null || taskTimeResult.endTime == null
          ? null
          : taskTimeResult.endTime;

      taskResult.fold(
        (failure) => emit(TaskDetailsError(failure.toString())),
        (task) {
          commentsResult.fold(
            (failure) => emit(TaskDetailsError(failure.toString())),
            (comments) =>
                emit(TaskDetailsLoaded(task, comments, startTime, endTime)),
          );
        },
      );
    } catch (e) {
      emit(TaskDetailsError(e.toString()));
    }
  }

  Future<void> _onStartTimerEvent(
      StartTimerEvent event, Emitter<TaskDetailsState> emit) async {
    if (state is TaskDetailsLoaded) {
      try {
        final taskId = (state as TaskDetailsLoaded).task.id;
        await _taskRepository.startTimer(DateTime.now(), taskId);

        emit(TaskDetailsLoaded((state as TaskDetailsLoaded).task,
            (state as TaskDetailsLoaded).comments, DateTime.now(), null));
      } catch (e) {
        emit(TaskDetailsError(e.toString()));
      }
    }
  }

  Future<void> _onStopTimerEvent(
      StopTimerEvent event, Emitter<TaskDetailsState> emit) async {
    if (state is TaskDetailsLoaded) {
      try {
        TaskTime? taskTime = await _taskRepository.getTaskTime(event.taskId);

        if (taskTime == null) {
          emit(TaskDetailsError("taskTime not found"));
        } else {
          final startTime = taskTime.startTime;
          final endTime = DateTime.now();
          final comments = (state as TaskDetailsLoaded).comments;
          final task = (state as TaskDetailsLoaded).task;

          var taskTimeNew = await _taskRepository.stopTimer(TaskTime(
              taskId: task.id, startTime: startTime, endTime: endTime));

          emit(TaskDetailsLoaded(
              task, comments, taskTimeNew.startTime, taskTimeNew.endTime));

          final taskBloc = BlocProvider.of<TaskBloc>(event.context);
          taskBloc.updateTask(task.copyWith(priority: 4));
          final notificationService = sl<NotificationService>();
          notificationService.showNotification(
              'Completed task', 'Your task ${task.content} is completed');
        }
      } catch (e) {
        emit(TaskDetailsError(e.toString()));
      }
    }
  }

  Future<void> addComment(Comment comment) async {
    try {
      final response = await _commentsRepository.addComment(comment);
      response.fold(
        (failure) => emit(TaskDetailsError(failure.toString())),
        (newComment) {
          if (state is TaskDetailsLoaded) {
            final updatedComments =
                List<Comment>.from((state as TaskDetailsLoaded).comments)
                  ..add(newComment);
            emit(TaskDetailsLoaded(
                (state as TaskDetailsLoaded).task,
                updatedComments,
                (state as TaskDetailsLoaded).startTime,
                (state as TaskDetailsLoaded).endTime));
          } else {
            emit(TaskDetailsLoaded(
                (state as TaskDetailsLoaded).task,
                [newComment],
                (state as TaskDetailsLoaded).startTime,
                (state as TaskDetailsLoaded).endTime));
          }
        },
      );
    } catch (e) {
      emit(TaskDetailsError(e.toString()));
    }
  }
}
