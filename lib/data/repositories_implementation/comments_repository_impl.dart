import 'package:dartz/dartz.dart';
import 'package:kanban_test/data/datasource/comments/comments_ds.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';
import 'package:kanban_test/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentsRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<Comment>>> getComments(String taskId) async {
    try {
      final List<Comment> comments = await remoteDataSource.getComments(taskId);
      return Right(comments);
    } catch (e) {
      print(e);
      return Left(Exception('Failed to load comments'));
    }
  }

  @override
  Future<Either<Exception, Comment>> addComment(Comment comment) async {
    try {
      final Comment commentResponse =
          await remoteDataSource.addComment(comment);
      return Right(commentResponse);
    } catch (e) {
      print(e);
      return Left(Exception('Failed to add comment'));
    }
  }
}
