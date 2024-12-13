import 'package:flutter/material.dart';

import '../../../domain/entities/post_entity.dart';
import '../../pages/post_add_update.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PostAddUpdateScreen(isUpdate: true, post: post),
        ),
      ),
      label: const Text("Edit"),
      icon: const Icon(Icons.edit),
    );
  }
}
