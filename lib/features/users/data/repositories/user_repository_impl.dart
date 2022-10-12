import 'package:assignment/core/errors/exception.dart';
import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/features/users/data/datasources/user_remote_datasource.dart';
import 'package:assignment/features/users/domain/entities/user.dart';
import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl(
      {required this.userRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final remoteUser = await userRemoteDataSource.getAllUserData();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
