part of 'create_delete_update_bloc.dart';

sealed class CreateDeleteUpdateState extends Equatable {
  const CreateDeleteUpdateState();
  
  @override
  List<Object> get props => [];
}

final class CreateDeleteUpdateInitial extends CreateDeleteUpdateState {}

final class CreateDeleteUpdateLoading extends CreateDeleteUpdateState {}

final class CreateDeleteUpdateSuccess extends CreateDeleteUpdateState {
  final String message;

  const CreateDeleteUpdateSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class CreateDeleteUpdateError extends CreateDeleteUpdateState {
  final String message;

  const CreateDeleteUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}

