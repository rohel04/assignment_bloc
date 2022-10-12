import 'dart:io';

import 'package:assignment/core/errors/exception.dart';
import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:assignment/features/users/data/datasources/user_remote_datasource.dart';
import 'package:assignment/features/users/domain/entities/todo.dart';
import 'package:assignment/features/users/domain/entities/album.dart';
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
      final remoteUsers = await userRemoteDataSource.getAllUserData();
      return Right(remoteUsers);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Album>>> getUserAlbums(int id) async {
    try {
      final remoteUserAlbums = await userRemoteDataSource.getUserAlbumsData(id);
      return Right(remoteUserAlbums);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getUserPosts(int id) async {
    try {
      final remoteUserPosts = await userRemoteDataSource.getUserPostsData(id);
      return Right(remoteUserPosts);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getUserTodos(int id) async {
    try {
      final remoteUserTodos = await userRemoteDataSource.getUserTodosData(id);
      return Right(remoteUserTodos);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
