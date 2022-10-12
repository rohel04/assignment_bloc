part of 'user_posts_bloc.dart';

abstract class UserPostsState extends Equatable {
  const UserPostsState();

  @override
  List<Object> get props => [];
}

class UserPostsInitial extends UserPostsState {}

class UserPostsLoading extends UserPostsState {}

class UserPostsLoaded extends UserPostsState {
  final List<Post> posts;

  UserPostsLoaded({required this.posts});
}

class UserPostsError extends UserPostsState {
  final String message;

  UserPostsError({required this.message});
}
