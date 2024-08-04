import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';
import 'package:kanban_test/presentation/blocs/task/task_event.dart';
import 'package:kanban_test/presentation/blocs/task/task_state.dart';
import 'package:kanban_test/presentation/screens/board/components/task_container.dart';
import 'package:kanban_test/presentation/screens/completed_tasks/components/list_shimmer.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedSasksScreenState();
}

class _CompletedSasksScreenState extends State<CompletedTasksScreen> {
  @override
  Future<void> didChangeDependencies() async {
    context.read<TaskBloc>().add(LoadTasks());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(tr('completed_tasks')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 28),
        child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
          if (state is TaskLoading) {
            return const ListShimmer();
          } else if (state is TaskLoaded) {
            List<Task> list = state.tasks
                .where((x) => x.priority == 4)
                .toList()
                .reversed
                .toList();
            return SingleChildScrollView(
              child: Column(
                  children: list.map((element) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskContainer(
                      title: element.content,
                      description: element.description ?? "",
                      id: element.id,
                      numberOfComments: element.comment_count ?? 0),
                );
              }).toList()),
            );
          } else if (state is TaskError) {
            return Center(child: Text("builder error:" + state.message));
          } else {
            return Center(child: Text('Try later'));
          }
        }),
      ),
    );
  }
}
