import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/users/domain/entities/todo.dart';
import 'package:assignment/features/users/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../posts/domain/usecases/get_post_details.dart';
import '../entities/album.dart';

class GetUserAlbums implements UseCases<List<Album>, UserAlbumsParams> {
  final UserRepository userRepository;

  GetUserAlbums({required this.userRepository});

  @override
  Future<Either<Failure, List<Album>>> call(UserAlbumsParams params) async {
    return await userRepository.getUserAlbums(params.id);
  }
}

class UserAlbumsParams {
  int id;

  UserAlbumsParams({required this.id});
}
