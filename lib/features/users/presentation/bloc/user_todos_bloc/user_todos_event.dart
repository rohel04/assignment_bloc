part of 'user_todos_bloc.dart';

abstract class UserTodosEvent extends Equatable {
  const UserTodosEvent();

  @override
  List<Object> get props => [];
}

class GetUserTodosEvent extends UserTodosEvent {
  int id;
  GetUserTodosEvent({required this.id});
}

class AddUserTodoEvent extends UserTodosEvent {
  Todo todo;

  AddUserTodoEvent({required this.todo});
}

class UpdateUserTodoEvent extends UserTodosEvent {
  Todo todo;
  UpdateUserTodoEvent({required this.todo});
}

class DeleteUserTodoEvent extends UserTodosEvent {
  Todo todo;
  DeleteUserTodoEvent({required this.todo});
}
