class AppRoutes {
  static const String board = '/';
  static const String completedTasks = '/completed-tasks';
  static const String taskDetails = '/task-details/:id';

  static String taskDetailsWithId(String id) => '/task-details/$id';
}
