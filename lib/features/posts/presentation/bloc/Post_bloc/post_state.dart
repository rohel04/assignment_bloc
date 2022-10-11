part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class Loading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded({required this.posts});
}

class PostDetailLoaded extends PostState {
  final Post post;

  PostDetailLoaded({required this.post});
}

class ErrorState extends PostState {
  final String message;

  ErrorState({required this.message});
}
