part of 'create_delete_update_bloc.dart';

sealed class CreateDeleteUpdateEvent extends Equatable {
  const CreateDeleteUpdateEvent();

  @override
  List<Object> get props => [];
}

class CreatePostEvent extends CreateDeleteUpdateEvent {
  final PostEntity postEntity;

  const CreatePostEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class UpdatePostEvent extends CreateDeleteUpdateEvent {
  final PostEntity postEntity;

  const UpdatePostEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class DeletePostEvent extends CreateDeleteUpdateEvent {
  final int id;

  const DeletePostEvent({required this.id});

  @override
  List<Object> get props => [id];
}
