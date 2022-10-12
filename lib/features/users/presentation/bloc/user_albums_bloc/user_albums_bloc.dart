import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_albums_event.dart';
part 'user_albums_state.dart';

class UserAlbumsBloc extends Bloc<UserAlbumsEvent, UserAlbumsState> {
  UserAlbumsBloc() : super(UserAlbumsInitial()) {
    on<UserAlbumsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
