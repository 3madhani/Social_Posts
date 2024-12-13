import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/create_delete_update/create_delete_update_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Post"),
      content: const Text("Are you sure you want to delete this post?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => BlocProvider.of<CreateDeleteUpdateBloc>(context)
              .add(DeletePostEvent(id: postId)),
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
