import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:mockito/mockito.dart';
import '../../test_utils/mock_data/mock_datasource.mocks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  late MockTaskRemoteDataSource mockTaskDataSource;

  setUp(() async {
    await dotenv.load();
    mockTaskDataSource = MockTaskRemoteDataSource();
  });

  group('getAllTasks', () {
    test('should return a list of tasks when the call is successful', () async {
      when(mockTaskDataSource.getAllTasks()).thenAnswer((_) async => [
            Task(
              id: '1',
              content: 'Test Task',
              is_completed: false,
              comment_count: 0,
              created_at: DateTime.now(),
            )
          ]);

      final result = await mockTaskDataSource.getAllTasks();

      expect(result, isA<List<Task>>());
      expect(result.length, 1);
      expect(result[0].content, 'Test Task');
    });

    test('should throw an exception when the call is unsuccessful', () async {
      when(mockTaskDataSource.getAllTasks())
          .thenThrow(Exception('Failed to load tasks'));

      expect(() => mockTaskDataSource.getAllTasks(), throwsException);
    });
  });
}
