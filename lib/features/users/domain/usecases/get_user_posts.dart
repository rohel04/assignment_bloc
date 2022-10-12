import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/users/domain/entities/todo.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../posts/domain/entities/post.dart';

class GetUserPosts implements UseCases<List<Post>, UserPostsParams> {
  final UserRepository userRepository;

  GetUserPosts({required this.userRepository});

  @override
  Future<Either<Failure, List<Post>>> call(UserPostsParams params) async {
    return await userRepository.getUserPosts(params.id);
  }
}

class UserPostsParams {
  int id;

  UserPostsParams({required this.id});
}
