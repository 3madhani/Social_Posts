import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';
import '../widgets/post_detail/body_post_detail.dart';

class PostDetailScreen extends StatelessWidget {
  final PostEntity post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Detail"),
      ),
      body: BodyPostDetail(post: post),
    );
  }
}

