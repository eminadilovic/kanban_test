import 'package:amplitude_flutter/amplitude.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_test/core/utils/amplitude_service.dart';
import 'package:kanban_test/core/utils/hive_service.dart';
import 'package:kanban_test/core/utils/notification_service.dart';
import 'package:kanban_test/data/datasource/comments/comments_ds.dart';
import 'package:kanban_test/data/datasource/task_time/task_time_ds.dart';
import 'package:kanban_test/data/datasource/tasks/tasks_ds.dart';
import 'package:kanban_test/data/repositories_implementation/comments_repository_impl.dart';
import 'package:kanban_test/data/repositories_implementation/task_repository_impl.dart';
import 'package:kanban_test/domain/repositories/comment_repository.dart';
import 'package:kanban_test/domain/repositories/task_repository.dart';
import 'package:kanban_test/core/routes/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerLazySingleton(() => HiveService())
    ..registerLazySingleton(() => AmplitudeService())
    ..registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
    )
    ..registerFactory<CommentsRemoteDataSource>(
      () => CommentRemoteDataSourceImpl(),
    )
    ..registerFactory<CommentRepository>(
      () => CommentRepositoryImpl(remoteDataSource: sl()),
    )
    ..registerLazySingleton(() => AppRouter())
    ..registerFactory<TaskTimeDataSource>(
      () => TaskTimeDataSourceImpl(),
    )
    ..registerLazySingleton(() => NotificationService());
}
