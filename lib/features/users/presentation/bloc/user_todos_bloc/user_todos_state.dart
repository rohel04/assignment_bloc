part of 'user_todos_bloc.dart';

abstract class UserTodosState extends Equatable {
  const UserTodosState();

  @override
  List<Object> get props => [];
}

class UserTodosInitial extends UserTodosState {}

class UserTodosLoading extends UserTodosState {}

class UserTodosLoaded extends UserTodosState {
  final List<Todo> todos;

  UserTodosLoaded({required this.todos});
}

class UserTodosError extends UserTodosState {
  final String message;

  UserTodosError({required this.message});
}
