import 'package:assignment/features/posts/domain/usecases/get_post_details.dart';
import 'package:assignment/features/users/domain/usecases/get_user_todos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/todo.dart';

part 'user_todos_event.dart';
part 'user_todos_state.dart';

class UserTodosBloc extends Bloc<UserTodosEvent, UserTodosState> {
  final GetUserTodos getUserTodos;

  UserTodosBloc({required GetUserTodos userTodos})
      : getUserTodos = userTodos,
        super(UserTodosInitial()) {
    on<UserTodosEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserTodosEvent>(
        (event, emit) async => await _getUserTodos(event, emit));
    on<AddUserTodoEvent>((event, emit) => _addUserTodo(event, emit));
    on<UpdateUserTodoEvent>((event, emit) => _updateUserTodo(event, emit));
    on<DeleteUserTodoEvent>((event, emit) => _deleteUserTodo(event, emit));
  }

  Future<void> _getUserTodos(
      GetUserTodosEvent event, Emitter<UserTodosState> emit) async {
    emit(UserTodosLoading());
    final failureOrtodo =
        await getUserTodos.call(UserTodosParams(id: event.id));
    await failureOrtodo.fold(
        (failure) async => emit(UserTodosError(message: 'Server Failure')),
        (todos) async => emit(UserTodosLoaded(todos: todos)));
  }

  void _addUserTodo(AddUserTodoEvent event, Emitter<UserTodosState> emit) {
    Todo todo = event.todo;
    final state = this.state;
    if (state is UserTodosLoaded) {
      emit(UserTodosLoaded(todos: List.from(state.todos)..add(todo)));
    }
  }

  void _updateUserTodo(
      UpdateUserTodoEvent event, Emitter<UserTodosState> emit) {
    final state = this.state;

    if (state is UserTodosLoaded) {
      print('Inside');
      List<Todo> todos = state.todos
          .map((e) => e.id == event.todo.id ? event.todo : e)
          .toList();
      emit(UserTodosLoaded(todos: todos));
    }
  }

  void _deleteUserTodo(
      DeleteUserTodoEvent event, Emitter<UserTodosState> emit) {
    final state = this.state;
    if (state is UserTodosLoaded) {
      List<Todo> todos =
          state.todos.where((element) => element.id != event.todo.id).toList();
      emit(UserTodosLoaded(todos: todos));
    }
  }
}
