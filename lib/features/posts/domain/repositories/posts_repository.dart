import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Post>> getPostDetail(int id);
  Future<Either<Failure, List<Comment>>> getPostComments(int id);
}
