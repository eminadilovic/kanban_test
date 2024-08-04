import 'package:equatable/equatable.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';
import 'package:kanban_test/domain/models/task/task.dart';

abstract class TaskDetailsState extends Equatable {
  const TaskDetailsState();

  @override
  List<Object?> get props => [];
}

class TaskDetailsInitial extends TaskDetailsState {}

class TaskDetailsLoading extends TaskDetailsState {}

class TaskDetailsLoaded extends TaskDetailsState {
  final Task task;
  final List<Comment> comments;
  final DateTime? startTime;
  final DateTime? endTime;

  const TaskDetailsLoaded(
      this.task, this.comments, this.startTime, this.endTime);

  @override
  List<Object?> get props =>
      [task, comments, startTime as Object?, endTime as Object?];
}

class TaskDetailsError extends TaskDetailsState {
  final String message;

  const TaskDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
