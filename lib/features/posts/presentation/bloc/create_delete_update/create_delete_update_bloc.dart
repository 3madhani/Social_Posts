import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/strings/success_string.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/use_cases/create_post.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/failures_string.dart';
import '../../../domain/use_cases/delete_post.dart';
import '../../../domain/use_cases/update_post.dart';

part 'create_delete_update_event.dart';
part 'create_delete_update_state.dart';

class CreateDeleteUpdateBloc
    extends Bloc<CreateDeleteUpdateEvent, CreateDeleteUpdateState> {
  final CreatePostUseCase createPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;

  CreateDeleteUpdateBloc({
    required this.createPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(CreateDeleteUpdateInitial()) {
    on<CreateDeleteUpdateEvent>((event, emit) async {
      if (event is CreatePostEvent) {
        emit(CreateDeleteUpdateLoading());
        final failureOrDoneMessage = await createPost(event.postEntity);
        emit(_mapDoneMessageOrErrorState(
            failureOrDoneMessage, createPostSuccessMessage));
      } else if (event is UpdatePostEvent) {
        emit(CreateDeleteUpdateLoading());
        final failureOrDoneMessage = await updatePost(event.postEntity);
        emit(_mapDoneMessageOrErrorState(
            failureOrDoneMessage, updatePostSuccessMessage));
      } else if (event is DeletePostEvent) {
        emit(CreateDeleteUpdateLoading());
        final failureOrDoneMessage = await deletePost(event.id);
        emit(_mapDoneMessageOrErrorState(
            failureOrDoneMessage, deletePostSuccessMessage));
      }
    });
  }

  CreateDeleteUpdateState _mapDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) =>
          CreateDeleteUpdateError(message: _mapFailureToMessage(failure)),
      (_) => CreateDeleteUpdateSuccess(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return serverFailureMessage;
      case const (OfflineFailure):
        return offlineFailureMessage;
      default:
        return 'Unexpected Error, Please try again.';
    }
  }
}
