import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/comment.dart';
import '../../../domain/usecases/get_posts_comments.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetPostComments getPostComments;

  CommentsBloc({required GetPostComments comments})
      : getPostComments = comments,
        super(CommentsInitial()) {
    on<CommentsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetCommentsEvent>((event, emit) async => _getPostComments(event, emit));
    on<AddCommentEvent>(((event, emit) async => _addComment(event, emit)));
  }
  Future<void> _getPostComments(
      GetCommentsEvent event, Emitter<CommentsState> emit) async {
    final id = event.id;
    emit(CommentLoading());
    final failureOrComments = await getPostComments.call(CommentParams(id: id));
    failureOrComments.fold(
        (failure) => emit(Error(
            message:
                failure is ServerFailure ? 'Server Failure' : 'Cache Failure')),
        (comments) => emit(CommentsLoaded(comments: comments)));
  }

  void _addComment(AddCommentEvent event, Emitter<CommentsState> emit) {
    final state = this.state;
    if (state is CommentsLoaded) {
      List<Comments> comments = List.from(state.comments)..add(event.comment);
      emit(CommentsLoaded(comments: comments));
    }
  }
}
