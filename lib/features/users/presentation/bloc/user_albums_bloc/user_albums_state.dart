part of 'user_albums_bloc.dart';

abstract class UserAlbumsState extends Equatable {
  const UserAlbumsState();
  
  @override
  List<Object> get props => [];
}

class UserAlbumsInitial extends UserAlbumsState {}
