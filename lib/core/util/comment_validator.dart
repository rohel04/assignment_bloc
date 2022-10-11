import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

class CommentValidator {
  Either<Failure, bool> inputEmptyChecker(String comment) {
    if (comment.isNotEmpty) {
      return Right(true);
    } else {
      return Left(EmptyFieldFailure());
    }
  }
}

class EmptyFieldFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
