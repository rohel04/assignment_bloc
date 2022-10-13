import 'package:assignment/features/posts/domain/usecases/get_post_details.dart';
import 'package:assignment/features/users/domain/usecases/get_user_todos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
}
