import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

import '../repositories/posts_repository.dart';

class GetAllPosts implements UseCases<List<Post>, NoParams> {
  final PostRepository postRepository;

  GetAllPosts({required this.postRepository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParams noparams) async {
    return await postRepository.getAllPosts();
  }
}
