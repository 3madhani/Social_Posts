import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';

import '../../../domain/entities/post_entity.dart';
import '../../pages/post_detail_screen.dart';

class PostListWidget extends StatelessWidget {
  final List<PostEntity> posts;
  const PostListWidget({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                post.id.toString(),
              ),
            ),
            title: Text(
              post.title,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: AppColors.primaryColor,
                    fontWeightDelta: 2,
                  ),
            ),
            subtitle: Text(
              post.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(
                  post: post,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
