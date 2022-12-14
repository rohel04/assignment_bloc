part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostEvent extends PostEvent {}

class GetPostDetailEvent extends PostEvent {
  int id;

  GetPostDetailEvent({required this.id});
}
