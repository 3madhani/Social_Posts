part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});

  @override
  List<Object> get props => [message];
}

final class PostsLoaded extends PostsState {
  final List<PostEntity> posts;

  const PostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}
