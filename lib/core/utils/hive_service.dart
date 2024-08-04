import 'package:hive_flutter/adapters.dart';
import 'package:kanban_test/data/models/task_time/task_time.dart';

class HiveService {
  HiveService();
  static const taskTimeBox = 'TaskTimeBox';

  Future<void> init() async {
    await Hive.initFlutter();
    print('Hive initialized');

    if (!Hive.isAdapterRegistered(TaskTimeAdapter().typeId)) {
      Hive.registerAdapter<TaskTime>(TaskTimeAdapter());
    }

    if (!Hive.isBoxOpen(taskTimeBox)) {
      print('openBox');
      await Hive.openBox<TaskTime>(taskTimeBox);
    }
  }
}
