import 'package:assignment/core/platform/network_info.dart';
import 'package:assignment/core/util/comment_validator.dart';
import 'package:assignment/features/posts/data/datasources/post_local_datasource.dart';
import 'package:assignment/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:assignment/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:assignment/features/posts/domain/repositories/posts_repository.dart';
import 'package:assignment/features/posts/domain/usecases/add_post_comments.dart';
import 'package:assignment/features/posts/domain/usecases/get_post_details.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts_comments.dart';
import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'package:assignment/features/users/data/datasources/user_remote_datasource.dart';
import 'package:assignment/features/users/data/repositories/user_repository_impl.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:assignment/features/users/domain/usecases/get_all_users.dart';
import 'package:assignment/features/users/domain/usecases/get_user_posts.dart';
import 'package:assignment/features/users/presentation/bloc/user_albums_bloc/user_albums_bloc.dart';
import 'package:assignment/features/users/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/users/domain/usecases/get_user_album.dart';
import 'features/users/domain/usecases/get_user_todos.dart';
import 'features/users/presentation/bloc/user_posts_bloc/user_posts_bloc.dart';
import 'features/users/presentation/bloc/user_todos_bloc/user_todos_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Post Bloc
  sl.registerFactory<PostBloc>(() => PostBloc(allPosts: sl(), detail: sl()));

  sl.registerFactory<CommentsBloc>(() =>
      CommentsBloc(comments: sl(), addcomment: sl(), commentValidator: sl()));

  //Post Usecase
  sl.registerLazySingleton(() => GetAllPosts(postRepository: sl()));
  sl.registerLazySingleton(() => GetPostDetails(postRepository: sl()));
  sl.registerLazySingleton(() => GetPostComments(postRepository: sl()));
  sl.registerLazySingleton(() => AddPostComment(postRepository: sl()));

  //Post Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImp(
      postRemoteDataSource: sl(),
      postlocalDataSource: sl(),
      networkInfo: sl()));

  //post Data Sources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceimpl());

  //user Bloc
  sl.registerFactory<UserBloc>(() => UserBloc(allUsers: sl()));
  sl.registerFactory<UserPostsBloc>(() => UserPostsBloc(userPosts: sl()));
  sl.registerFactory<UserTodosBloc>(() => UserTodosBloc(userTodos: sl()));
  sl.registerFactory<UserAlbumsBloc>(() => UserAlbumsBloc(userAlbums: sl()));

  //User Usecase
  sl.registerLazySingleton(() => GetAllUsers(userRepository: sl()));
  sl.registerLazySingleton(() => GetUserPosts(userRepository: sl()));
  sl.registerLazySingleton(() => GetUserTodos(userRepository: sl()));
  sl.registerLazySingleton(() => GetUserAlbums(userRepository: sl()));

  //User Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl(), networkInfo: sl()));

//User datasources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(client: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetConnectionChecker: sl()));
  sl.registerLazySingleton(() => CommentValidator());

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
