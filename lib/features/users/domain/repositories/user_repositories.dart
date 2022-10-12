import 'package:assignment/features/users/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
}
