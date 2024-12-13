import '../entities/post_entity.dart';
import'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
abstract class PostRepository {

  Future<Either<Failure,List<PostEntity>>> getAllPosts();

  Future<Either<Failure,Unit>> createPost(PostEntity post);

  Future<Either<Failure,Unit>> updatePost(PostEntity post);

  Future<Either<Failure,Unit>> deletePost(int id);

}