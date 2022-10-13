import 'package:assignment/features/users/domain/usecases/get_user_album.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/album.dart';

part 'user_albums_event.dart';
part 'user_albums_state.dart';

class UserAlbumsBloc extends Bloc<UserAlbumsEvent, UserAlbumsState> {
  final GetUserAlbums getUserAlbums;

  UserAlbumsBloc({required GetUserAlbums userAlbums})
      : getUserAlbums = userAlbums,
        super(UserAlbumsInitial()) {
    on<UserAlbumsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserAlbumsEvent>(
        (event, emit) async => await _getUserAlbums(event, emit));
  }

  Future<void> _getUserAlbums(
      GetUserAlbumsEvent event, Emitter<UserAlbumsState> emit) async {
    emit(UserAlbumsLoading());
    final failureOralbum =
        await getUserAlbums.call(UserAlbumsParams(id: event.id));
    await failureOralbum.fold(
        (failure) async => emit(UserAlbumsError(message: 'Server Failure')),
        (albums) async => emit(UserAlbumsLoaded(albums: albums)));
  }
}
