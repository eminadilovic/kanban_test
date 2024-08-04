import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TaskDetailsEvent extends Equatable {
  const TaskDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadTaskDetails extends TaskDetailsEvent {
  final String taskId;

  const LoadTaskDetails(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class StartTimerEvent extends TaskDetailsEvent {
  final String taskId;

  const StartTimerEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class StopTimerEvent extends TaskDetailsEvent {
  final String taskId;
  final int elapsedSeconds;
  final BuildContext context;

  const StopTimerEvent(this.taskId, this.elapsedSeconds, this.context);

  @override
  List<Object> get props => [taskId, elapsedSeconds];
}
