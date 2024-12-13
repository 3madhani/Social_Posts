import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../models/post_model.dart';

import '../../domain/entities/post_entity.dart';

import '../../domain/repository/post_repository.dart';
import '../data_sources/local/post_local_data_source.dart';
import '../data_sources/remote/post_remote_data_source.dart';

typedef Action = Future<Unit> Function();

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;
  PostRepositoryImpl({
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await postRemoteDataSource.getAllPosts();
        postLocalDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await postLocalDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> createPost(PostEntity post) async {
    final PostModel postModel = PostModel(
      title: post.title,
      body: post.body,
    );


    return _getMessage(() => postRemoteDataSource.createPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return _getMessage(() => postRemoteDataSource.deletePost(id));
  }

  @override
  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    return _getMessage(() => postRemoteDataSource.updatePost(postModel));
  }

  Future<Either<Failure, Unit>> _getMessage(Action action) async {
    if (await networkInfo.isConnected) {
      try {
        await action();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
