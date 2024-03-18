import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/widgets/post_item.dart';

import '../../../../../config/routes/routes.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    BlocProvider.of<RemotePostBloc>(context).add(const GetPosts());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
        actions: [
          IconButton(
            onPressed:_onShowSavedPostsTapped,
            icon: const Icon(Icons.bookmark),
          ),
        ],
      ),
      body: BlocBuilder<RemotePostBloc, RemotePostState>(
          builder: ((context, state) {
        if (state is RemotePostsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemotePostsError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemotePostsDone) {
          return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                return PostItem(
                  postEntity: state.posts![index],
                  onPostPressed:_onPostPressed,
                  color: index % 3 == 0
                      ? AppColors.gradient1
                      : index % 3 == 1
                          ? AppColors.gradient2
                          : AppColors.gradient3,
                );
              });
        }
        return const Center(
          child: Text('something went wrong'),
        );
      })),
    );
  }

  void _onPostPressed(PostEntity post) {
    Navigator.pushNamed(context, AppRouteNames.postDetail, arguments: post);
  }

  void _onShowSavedPostsTapped() {
    Navigator.pushNamed(context, AppRouteNames.savedPosts);
  }
}
