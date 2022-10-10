import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/posts_repository.dart';

class GetPostDetails implements UseCases<Post, Params> {
  final PostRepository postRepository;

  GetPostDetails({required this.postRepository});

  @override
  Future<Either<Failure, Post>> call(Params params) async {
    return await postRepository.getPostDetail(params.id);
  }
}

class Params extends Equatable {
  int id;

  Params({required this.id});

  @override
  List<Object?> get props => [];
}
