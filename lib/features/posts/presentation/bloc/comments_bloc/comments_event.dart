part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class GetCommentsEvent extends CommentsEvent {
  int id;
  GetCommentsEvent({required this.id});
}

class AddCommentEvent extends CommentsEvent {
  final Comments comment;

  AddCommentEvent({required this.comment});
}
