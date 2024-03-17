import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/widgets/post_item.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
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
}
