import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/common/widgets/loading_widgets.dart';
import '../../../../core/utils/common/widgets/snack_bar.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/create_delete_update/create_delete_update_bloc.dart';
import 'post_home_screen.dart';

import '../widgets/add_update_widgets/form_widget.dart';

class PostAddUpdateScreen extends StatelessWidget {
  final PostEntity? post;
  final bool isUpdate;
  const PostAddUpdateScreen({super.key, this.post, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            isUpdate ? "Update Post" : "Add Post",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: BlocConsumer<CreateDeleteUpdateBloc, CreateDeleteUpdateState>(
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
              SnackBarMessage.showErrorSnackBar(
                context: context,
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is CreateDeleteUpdateLoading) {
              return const LoadingWidget();
            }

            return FormWidget(
              postEntity: isUpdate ? post : null,
              isUpdate: isUpdate,
            );
          },
        ));
  }
}
