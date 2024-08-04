// lib/presentation/screens/task_details_screen.dart
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/core/constants/styles.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';
import 'package:kanban_test/presentation/blocs/task_details/task_details_bloc.dart';
import 'package:kanban_test/presentation/blocs/task_details/task_details_event.dart';
import 'package:kanban_test/presentation/blocs/task_details/task_details_state.dart';
import 'package:kanban_test/presentation/screens/task_details/components/task_details_shimmer.dart';

class TaskDetailsScreen extends StatefulWidget {
  final String taskId;

  const TaskDetailsScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    context.read<TaskDetailsBloc>().add(LoadTaskDetails(widget.taskId));
  }

  void _startTimer(int? addedSeconds) {
    if (_isRunning) return;
    _isRunning = true;
    if (addedSeconds != null) {
      _elapsedSeconds += addedSeconds;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _onStartFirstTime() {
    _startTimer(null);
    context.read<TaskDetailsBloc>().add(StartTimerEvent(widget.taskId));
  }

  void _onAddComment(String taskId, String content) {
    context
        .read<TaskDetailsBloc>()
        .addComment(Comment(id: '123', content: content, task_id: taskId));
  }

  void _stopTimer() {
    if (!_isRunning) return;
    _isRunning = false;
    context
        .read<TaskDetailsBloc>()
        .add(StopTimerEvent(widget.taskId, _elapsedSeconds, context));
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('task_details'))),
      body: BlocBuilder<TaskDetailsBloc, TaskDetailsState>(
        builder: (context, state) {
          if (state is TaskDetailsLoading) {
            return const TaskDetailsShimmer();
          } else if (state is TaskDetailsLoaded) {
            if (state.startTime != null &&
                state.endTime == null &&
                _isRunning == false) {
              _startTimer(
                  DateTime.now().difference(state.startTime!).inSeconds);
            }
            return _buildTaskDetails(
              state.task,
              state.comments,
              context,
              state.startTime,
              state.endTime,
            );
          } else if (state is TaskDetailsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }

  Widget _buildTaskDetails(Task task, List<Comment> comments,
      BuildContext context, DateTime? start, DateTime? end) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(tr('task') + ': \n${task.content}',
            style: CustomTextStyles.header),
        const Divider(),
        const SizedBox(height: 10),
        Text(tr('description') + ': \n${task.description ?? ''}',
            style: CustomTextStyles.header2),
        const Divider(),
        const SizedBox(height: 20),
        _buildTimerControls(task, start, end),
        const Divider(),
        GestureDetector(
          onTap: () {
            _showPopup(context, widget.taskId);
          },
          child: Container(
            child: Text(tr('add_comment')),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300)),
          ),
        ),
        Text(tr('comments') + ':',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...comments.map((comment) => Container(
              child: Text(comment.content),
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
            )),
      ],
    );
  }

  Widget _buildTimerControls(Task task, DateTime? start, DateTime? end) {
    return Column(
      children: [
        if (!(start != null && end != null))
          Text(
            tr('time') +
                ':' +
                '${(_elapsedSeconds ~/ 60).toString().padLeft(2, '0')}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}',
            style: CustomTextStyles.title,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            start == null && end == null
                ? ElevatedButton(
                    onPressed: _onStartFirstTime,
                    child: Icon(Icons.play_arrow),
                  )
                : start != null && end == null
                    ? ElevatedButton(
                        onPressed: _stopTimer,
                        child: Icon(Icons.stop),
                      )
                    : Column(
                        children: [
                          Text(tr('time_spent') +
                              ': ' +
                              end!.difference(start!).inMinutes.toString() +
                              ' ' +
                              'minutes'),
                          Text(tr('completed_at') +
                              ': ' +
                              end.day.toString() +
                              '/' +
                              end.month.toString() +
                              '/' +
                              end.year.toString()),
                        ],
                      )
          ],
        ),
      ],
    );
  }

  void _showPopup(BuildContext context, String taskId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';

        return AlertDialog(
          title: const Text('Enter Comment Details'),
          content: TextField(
            decoration: const InputDecoration(
              labelText: 'Comment',
            ),
            onChanged: (value) {
              title = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                _onAddComment(taskId, title);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
