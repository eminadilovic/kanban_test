import 'package:dartz/dartz.dart';
import 'package:kanban_test/domain/models/comment/comment.dart';

abstract class CommentRepository {
  Future<Either<Exception, List<Comment>>> getComments(String taskId);
  Future<Either<Exception, Comment>> addComment(Comment comment);
}
