import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/posts_repository.dart';

class AddPostComment implements UseCases<Comments, addCommentParams> {
  final PostRepository postRepository;

  AddPostComment({required this.postRepository});

  @override
  Future<Either<Failure, Comments>> call(addCommentParams params) async {
    return await postRepository.addPostComments(
        params.id, params.post_id, params.name, params.email, params.body);
  }
}

class addCommentParams extends Equatable {
  int post_id;
  int id;
  String name;
  String email;
  String body;

  addCommentParams(
      {required this.id,
      required this.email,
      required this.body,
      required this.name,
      required this.post_id});

  @override
  List<Object?> get props => [];
}
