import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/post_widgets/error_widget.dart';

import '../bloc/posts/posts_bloc.dart';
import '../../../../core/utils/common/widgets/loading_widgets.dart';
import '../widgets/post_widgets/post_list_widget.dart';
import 'post_add_update.dart';

class PostsHomeScreen extends StatelessWidget {
  const PostsHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Posts")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const LoadingWidget();
            } else if (state is PostsLoaded) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PostListWidget(
                  posts: state.posts,
                ),
              );
            } else if (state is PostsError) {
              return ErrorDisplayWidget(
                message: state.message,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PostAddUpdateScreen(
              isUpdate: false,
            ),
          ),
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
