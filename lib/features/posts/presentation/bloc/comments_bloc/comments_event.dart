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
  int id;
  int postId;
  String name;
  String email;
  String body;

  AddCommentEvent(
      {required this.id,
      required this.body,
      required this.email,
      required this.name,
      required this.postId});
}
