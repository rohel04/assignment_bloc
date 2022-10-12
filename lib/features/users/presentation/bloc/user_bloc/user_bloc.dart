import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts.dart';
import 'package:assignment/features/users/domain/entities/user.dart';
import 'package:assignment/features/users/domain/usecases/get_all_users.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsers getAllUsers;

  UserBloc({required GetAllUsers allUsers})
      : getAllUsers = allUsers,
        super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetAllUserEvent>((event, emit) async {
      await _getAllUser(event, emit);
    });
  }

  Future<void> _getAllUser(
      GetAllUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final failureOrUsers = await getAllUsers.call(NoParams());
    await failureOrUsers.fold(
        (failure) async => emit(UserError(message: 'Server Failure')),
        (users) async => emit(UserLoaded(users: users)));
  }
}
