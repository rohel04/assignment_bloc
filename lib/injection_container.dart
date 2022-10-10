import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/features/posts/data/datasources/post_local_datasource.dart';
import 'package:assignment/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:assignment/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:assignment/features/posts/domain/repositories/posts_repository.dart';
import 'package:assignment/features/posts/domain/usecases/get_post_details.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts_comments.dart';
import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Post Bloc
  sl.registerFactory<PostBloc>(() => PostBloc(allPosts: sl(), detail: sl()));

  sl.registerFactory<CommentsBloc>(() => CommentsBloc(comments: sl()));

  //Post Usecase
  sl.registerLazySingleton(() => GetAllPosts(postRepository: sl()));
  sl.registerLazySingleton(() => GetPostDetails(postRepository: sl()));
  sl.registerLazySingleton(() => GetPostComments(postRepository: sl()));

  //Post Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImp(
      postRemoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //Data Sources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceimpl());

  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetConnectionChecker: sl()));

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
