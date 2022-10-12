import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:assignment/features/users/domain/entities/album.dart';
import 'package:assignment/features/users/domain/entities/todo.dart';
import 'package:assignment/features/users/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, List<Post>>> getUserPosts(int id);
  Future<Either<Failure, List<Todo>>> getUserTodos(int id);
  Future<Either<Failure, List<Album>>> getUserAlbums(int id);
}
