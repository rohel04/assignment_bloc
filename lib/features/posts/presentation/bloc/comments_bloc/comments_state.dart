part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comments> comments;

  CommentsLoaded({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentError extends CommentsState {
  final String message;

  CommentError({required this.message});
}

class CommentInputError extends CommentsState {}
