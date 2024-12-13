import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();

  Future<Unit> cachePosts(List<PostModel> posts);
}
const CACHED_POSTS = 'CACHED_POSTS';
class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);

    if (jsonString != null) {
      List decodedJson = json.decode(jsonString);

      List<PostModel> jsonPosts =
          decodedJson.map<PostModel>((post) => PostModel.fromJson(post)).toList();

      return Future.value(jsonPosts);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cachePosts(List<PostModel> posts) {
    List postModelToJson =
        posts.map<Map<String, dynamic>>((post) => post.toJson()).toList();

    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelToJson));

    return Future.value(unit);
  }
}
