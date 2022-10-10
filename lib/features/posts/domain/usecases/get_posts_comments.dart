import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/posts_repository.dart';

class GetPostComments implements UseCases<List<Comments>, CommentParams> {
  final PostRepository postRepository;

  GetPostComments({required this.postRepository});

  @override
  Future<Either<Failure, List<Comments>>> call(CommentParams params) async {
    return await postRepository.getPostComments(params.id);
  }
}

class CommentParams extends Equatable {
  int id;

  CommentParams({required this.id});

  @override
  List<Object?> get props => [];
}
