import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/common/widgets/loading_widgets.dart';
import '../../../../../core/utils/common/widgets/snack_bar.dart';
import '../../bloc/create_delete_update/create_delete_update_bloc.dart';
import '../../pages/post_home_screen.dart';
import 'delete_dialog_widget.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.red,
      ),
      onPressed: () => deletePost(context),
      label: const Text("Delete"),
      icon: const Icon(Icons.delete_outline_rounded),
    );
  }

  void deletePost(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          BlocConsumer<CreateDeleteUpdateBloc, CreateDeleteUpdateState>(
        listener: (context, state) {
          if (state is CreateDeleteUpdateSuccess) {
            SnackBarMessage.showSuccessSnackBar(
              context: context,
              message: state.message,
            );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const PostsHomeScreen(),
              ),
              (route) => false,
            );
          } else if (state is CreateDeleteUpdateError) {
            Navigator.pop(context);
            SnackBarMessage.showErrorSnackBar(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          if (state is CreateDeleteUpdateLoading) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              title: LoadingWidget(),
            );
          }
          return DeleteDialogWidget(postId: postId);
        },
      ),
    );
  }
}
