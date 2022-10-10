import 'package:assignment/core/usecases/usecase.dart';
import 'package:assignment/features/posts/domain/entities/post.dart';
import 'package:assignment/features/posts/domain/usecases/get_post_details.dart';
import 'package:assignment/features/posts/domain/usecases/get_posts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts getAllPosts;
  final GetPostDetails getPostDetails;

  PostBloc({required GetPostDetails detail, required GetAllPosts allPosts})
      : getAllPosts = allPosts,
        getPostDetails = detail,
        super(PostInitial()) {
    on<GetAllPostEvent>((event, emit) async {
      await _getAllPosts(event, emit);
    });
    on<GetPostDetailEvent>(
        (event, emit) async => await _getPostDetail(event, emit));
  }

  Future<void> _getAllPosts(GetAllPostEvent, Emitter<PostState> emit) async {
    emit(Loading());
    final failureOrpost = await getAllPosts.call(NoParams());
    await failureOrpost.fold(
        (failure) async =>
            failure is ServerFailure ? 'Server Failure' : 'Cache Failure',
        (posts) async => emit(PostLoaded(posts: posts)));
  }

  Future<void> _getPostDetail(
      GetPostDetailEvent event, Emitter<PostState> emit) async {
    final id = event.id;
    emit(Loading());
    final failureOrpost = await getPostDetails.call(Params(id: id));
    failureOrpost.fold(
        (failure) =>
            failure is ServerFailure ? 'Server Failure' : 'Cache Failure',
        (post) => emit(PostDetailLoaded(post: post)));
  }
}
