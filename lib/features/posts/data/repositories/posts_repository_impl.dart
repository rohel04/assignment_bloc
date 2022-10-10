import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/features/posts/data/datasources/post_local_datasource.dart';
import 'package:assignment/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';

class PostRepositoryImp implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImp(
      {required this.postRemoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePost = await postRemoteDataSource.getAllPostData();
      return Right(remotePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Post>> getPostDetail(int id) async {
    try {
      final post = await postRemoteDataSource.getPostDetailData(id);
      return Right(post);
    } on ServerException {
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
    }
  }
}
