part of 'user_albums_bloc.dart';

abstract class UserAlbumsState extends Equatable {
  const UserAlbumsState();

  @override
  List<Object> get props => [];
}

class UserAlbumsInitial extends UserAlbumsState {}

class UserAlbumsLoading extends UserAlbumsState {}

class UserAlbumsLoaded extends UserAlbumsState {
  final List<Album> albums;

  UserAlbumsLoaded({required this.albums});
}

class UserAlbumsError extends UserAlbumsState {
  final String message;

  UserAlbumsError({required this.message});
}
