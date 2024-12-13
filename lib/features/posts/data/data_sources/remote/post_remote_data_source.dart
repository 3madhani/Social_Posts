// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:social_posts/core/utils/constants/api_constant.dart';

import 'package:social_posts/features/posts/data/models/post_model.dart';

import '../../../../../core/errors/exceptions.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> createPost(PostModel post);

  Future<Unit> updatePost(PostModel post);

  Future<Unit> deletePost(int id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  PostRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> createPost(PostModel post) async {
    final body = {
      'title': post.title,
      'body': post.body,
    };

    final response = await client.post(
      Uri.parse('$baseUrl/posts/'),
      body: body,
    );

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/posts/${id.toString()}'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    final postId = post.id.toString();

    final body = {
      'title': post.title,
      'body': post.body,
    };

    final response = await client.patch(
      Uri.parse('$baseUrl/posts/$postId'),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
