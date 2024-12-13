import 'package:flutter/material.dart';
import 'delete_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../domain/entities/post_entity.dart';
import 'update_button.dart';

class BodyPostDetail extends StatelessWidget {
  const BodyPostDetail({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            post.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: AppColors.primaryColor,
                  fontWeightDelta: 2,
                ),
          ),
          const Divider(
            height: 50,
            thickness: .5,
            color: AppColors.primaryColor,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            post.body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(
            height: 50,
            thickness: .5,
            color: AppColors.primaryColor,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdateButton(post: post),
              DeleteButton(postId: post.id!),
            ],
          )
        ],
      ),
    );
  }
}
