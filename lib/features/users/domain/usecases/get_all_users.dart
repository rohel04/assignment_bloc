import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

class GetAllUsers implements UseCases<List<User>, NoParams> {
  final UserRepository userRepository;

  GetAllUsers({required this.userRepository});

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await userRepository.getAllUsers();
  }
}
