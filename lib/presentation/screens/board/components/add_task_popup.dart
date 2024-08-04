import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/core/constants/sections.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';

class TaskDetailsPopup extends StatefulWidget {
  final String columnId;

  const TaskDetailsPopup({super.key, required this.columnId});

  @override
  _TaskDetailsPopupState createState() => _TaskDetailsPopupState();
}

class _TaskDetailsPopupState extends State<TaskDetailsPopup> {
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tr('enter_task_details')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: tr('title'),
            ),
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: tr('description'),
            ),
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(tr('cancel')),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(tr('done')),
          onPressed: () {
            context.read<TaskBloc>().addTask(Task(
                content: title,
                description: description,
                id: "1",
                is_completed: false,
                priority: widget.columnId == '3'
                    ? priorities[Priority.done]
                    : widget.columnId == '2'
                        ? priorities[Priority.inProgress]
                        : priorities[Priority.todo],
                comment_count: 0,
                created_at: DateTime.now()));

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
