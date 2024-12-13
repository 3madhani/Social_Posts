import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

import '../repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository postRepository;

  DeletePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await postRepository.deletePost(id);
  }
}
