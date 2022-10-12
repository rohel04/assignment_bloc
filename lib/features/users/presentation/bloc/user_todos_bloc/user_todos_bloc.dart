import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_todos_event.dart';
part 'user_todos_state.dart';

class UserTodosBloc extends Bloc<UserTodosEvent, UserTodosState> {
  UserTodosBloc() : super(UserTodosInitial()) {
    on<UserTodosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
