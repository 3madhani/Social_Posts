import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/posts/domain/use_cases/create_post.dart';
import 'features/posts/domain/use_cases/delete_post.dart';
import 'features/posts/domain/use_cases/update_post.dart';
import 'features/posts/presentation/bloc/create_delete_update/create_delete_update_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

import 'core/network/network_info.dart';
import 'features/posts/data/data_sources/local/post_local_data_source.dart';
import 'features/posts/data/data_sources/remote/post_remote_data_source.dart';
import 'features/posts/data/repository/post_repository_impl.dart';
import 'features/posts/domain/repository/post_repository.dart';
import 'features/posts/domain/use_cases/get_all_posts.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // feature post

  // bloc
  sl.registerFactory(
    () => PostsBloc(
      getAllPosts: sl(),
    ),
  );

  sl.registerFactory(
    () => CreateDeleteUpdateBloc(
      createPost: sl(),
      updatePost: sl(),
      deletePost: sl(),
    ),
  );

  // use_case

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => CreatePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));

  // repository

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        postRemoteDataSource: sl(),
        postLocalDataSource: sl(),
        networkInfo: sl(),
      ));

  // data source

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));


  // core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // external

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
