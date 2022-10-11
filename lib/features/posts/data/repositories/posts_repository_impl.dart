import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/features/posts/data/datasources/post_local_datasource.dart';
import 'package:assignment/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../../../core/errors/exception.dart';

class PostRepositoryImp implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postlocalDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImp(
      {required this.postRemoteDataSource,
      required this.postlocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    var dir = await getTemporaryDirectory();
    String filename = 'postsData.json';
    File file = File('${dir.path}/$filename');
    if (await networkInfo.isConnected) {
      try {
        final remotePost = await postRemoteDataSource.getAllPostData();
        postlocalDataSource.cacheAllPostToLocal(remotePost, file);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localpost = await postlocalDataSource.getAllPostFromLocal(file);
        return Right(localpost);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Post>> getPostDetail(int id) async {
    try {
      final post = await postRemoteDataSource.getPostDetailData(id);
      return Right(post);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Comments>>> getPostComments(int id) async {
    try {
      final failureOrComments =
          await postRemoteDataSource.getPostCommentsData(id);
      return Right(failureOrComments);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Comments>> addPostComments(
      int id, int postId, String name, String email, String body) async {
    try {
      final failureOrComment = await postRemoteDataSource.addPostComments(
          id, postId, name, email, body);
      return Right(failureOrComment);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
