part of 'user_albums_bloc.dart';

abstract class UserAlbumsEvent extends Equatable {
  const UserAlbumsEvent();

  @override
  List<Object> get props => [];
}

class GetUserAlbumsEvent extends UserAlbumsEvent {
  int id;

  GetUserAlbumsEvent({required this.id});
}
