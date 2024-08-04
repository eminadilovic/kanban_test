import 'package:dio/dio.dart';
import 'package:kanban_test/core/utils/http_client.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';

abstract class CommentsRemoteDataSource {
  Future<List<Comment>> getComments(String taskId);
  Future<Comment> addComment(Comment comment);
}

class CommentRemoteDataSourceImpl implements CommentsRemoteDataSource {
  CommentRemoteDataSourceImpl();

  @override
  Future<List<Comment>> getComments(String taskId) async {
    try {
      Response? response =
          await Http.getDio()?.get('rest/v2/comments?task_id=$taskId');
      if (response?.statusCode == 200) {
        final List<dynamic> jsonData = response?.data as List<dynamic>;
        final List<Comment> comments = jsonData
            .map((dynamic item) =>
                Comment.fromJson(item as Map<String, dynamic>))
            .toList();
        return comments;
      } else {
        throw Exception('Failed to load comments');
      }
    } on DioException catch (e) {
      print("Dio exception: $e");
      if (e.response != null) {
        return [];
      }
    }
    return [];
  }

  @override
  Future<Comment> addComment(Comment comment) async {
    final response =
        await Http.getDio()?.post('rest/v2/comments', data: comment.toJson());
    return Comment.fromJson(response?.data);
  }
}
