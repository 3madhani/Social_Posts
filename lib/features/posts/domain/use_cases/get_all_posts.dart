import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entity.dart';
import '../repository/post_repository.dart';

class GetAllPostsUseCase {
  GetAllPostsUseCase(this.postRepository);

  final PostRepository postRepository;

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepository.getAllPosts();
  }
}
