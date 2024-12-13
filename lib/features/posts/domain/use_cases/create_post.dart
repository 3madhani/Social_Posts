import 'package:dartz/dartz.dart';
import '../repository/post_repository.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entity.dart';

class CreatePostUseCase {
  final PostRepository postRepository;

  CreatePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(PostEntity post) async =>
      await postRepository.createPost(post);
}
