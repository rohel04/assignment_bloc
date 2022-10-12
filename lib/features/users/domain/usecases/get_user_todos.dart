import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/users/domain/entities/todo.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../posts/domain/usecases/get_post_details.dart';
import '../entities/album.dart';

class GetUserTodos implements UseCases<List<Todo>, UserTodosParams> {
  final UserRepository userRepository;

  GetUserTodos({required this.userRepository});

  @override
  Future<Either<Failure, List<Todo>>> call(UserTodosParams params) async {
    return await userRepository.getUserTodos(params.id);
  }
}

class UserTodosParams {
  int id;

  UserTodosParams({required this.id});
}
