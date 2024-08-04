import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_test/core/routes/app_routes.dart';
import 'package:kanban_test/core/themes/theme_bloc.dart';
import 'package:kanban_test/core/themes/theme_event.dart';
import 'package:kanban_test/core/utils/amplitude_service.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';
import 'package:kanban_test/presentation/blocs/task/task_event.dart';
import 'package:kanban_test/presentation/blocs/task/task_state.dart';
import 'package:kanban_test/presentation/screens/board/components/board_widget.dart';
import 'package:kanban_test/presentation/screens/board/components/kanban_shimmer.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:kanban_test/service_locator.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
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
        title: Text(tr('kanban')),
        leading: IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: () {
            context.read<ThemeBloc>().add(ToggleThemeEvent());
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              sl<AmplitudeService>().logEvent("Completed_tasks");

              context.push(AppRoutes.completedTasks);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tr("completed_tasks")),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 28),
        child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
          if (state is TaskLoading) {
            return const KanbanShimmer();
          } else if (state is TaskLoaded) {
            return BoardWidget(tasks: state.tasks);
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
