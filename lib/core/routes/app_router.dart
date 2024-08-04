// lib/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_test/presentation/blocs/task_details/task_details_bloc.dart';
import 'package:kanban_test/presentation/screens/board/BoardScreen.dart';
import 'package:kanban_test/presentation/screens/completed_tasks/CompletedTasksScreen.dart';
import 'package:kanban_test/presentation/screens/task_details/TaskDetailsScreen.dart';
import 'app_routes.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.board,
        builder: (context, state) => const BoardScreen(),
      ),
      GoRoute(
        path: AppRoutes.completedTasks,
        builder: (context, state) => const CompletedTasksScreen(),
      ),
      GoRoute(
        path: AppRoutes.taskDetails,
        builder: (context, state) {
          final taskId = state.pathParameters['id']!;
          return BlocProvider(
            create: (context) => TaskDetailsBloc(),
            child: TaskDetailsScreen(
              key: ValueKey(taskId),
              taskId: taskId,
            ),
          );
        },
      ),
    ],
  );
}
