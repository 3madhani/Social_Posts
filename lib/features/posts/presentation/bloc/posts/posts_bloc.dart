import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/strings/failures_string.dart';
import '../../../domain/use_cases/get_all_posts.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/post_entity.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(PostsLoading());

        final failureOrPosts = await getAllPosts();

        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(PostsLoading());

        final failureOrPosts = await getAllPosts();

        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  PostsState _mapFailureOrPostsToState(
      Either<Failure, List<PostEntity>> either) {
    return either.fold(
        (failure) => PostsError(message: _mapFailureToMessage(failure)),
        (posts) => PostsLoaded(posts: posts));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return serverFailureMessage;
      case const (EmptyCacheFailure):
        return emptyCacheFailureMessage;
      case const (OfflineFailure):
        return offlineFailureMessage;
      default:
        return 'Unexpected Error, Please try again.';
    }
  }
}
