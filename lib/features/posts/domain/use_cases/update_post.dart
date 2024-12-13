import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

import '../entities/post_entity.dart';
import '../repository/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository postRepository;

  UpdatePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(PostEntity post) async =>
      await postRepository.updatePost(post);
}
