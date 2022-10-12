part of 'user_posts_bloc.dart';

abstract class UserPostsEvent extends Equatable {
  const UserPostsEvent();

  @override
  List<Object> get props => [];
}

class GetUserAllPostsEvent extends UserPostsEvent {
  final int id;
  GetUserAllPostsEvent({required this.id});
}
