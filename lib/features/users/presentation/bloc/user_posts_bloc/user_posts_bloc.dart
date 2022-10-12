import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/users/domain/usecases/get_user_album.dart';
import 'package:assignment/features/users/domain/usecases/get_user_posts.dart';
import 'package:assignment/features/users/domain/usecases/get_user_todos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../posts/domain/entities/post.dart';

part 'user_posts_event.dart';
part 'user_posts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  final GetUserPosts getUserPosts;
  UserPostsBloc({
    required GetUserPosts userPosts,
  })  : getUserPosts = userPosts,
        super(UserPostsInitial()) {
    on<UserPostsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserAllPostsEvent>(
        (event, emit) async => await _getUserAllPosts(event, emit));
  }

  Future<void> _getUserAllPosts(
      GetUserAllPostsEvent event, Emitter<UserPostsState> emit) async {
    emit(UserPostsLoading());
    final failureOrposts =
        await getUserPosts.call(UserPostsParams(id: event.id));
    await failureOrposts.fold(
        (failure) async => emit(UserPostsError(message: 'Server Failure')),
        (posts) async => emit(UserPostsLoaded(posts: posts)));
  }
}
