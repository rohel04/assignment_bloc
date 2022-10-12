part of 'user_todos_bloc.dart';

abstract class UserTodosState extends Equatable {
  const UserTodosState();
  
  @override
  List<Object> get props => [];
}

class UserTodosInitial extends UserTodosState {}
