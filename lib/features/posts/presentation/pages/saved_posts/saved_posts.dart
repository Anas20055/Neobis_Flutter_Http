import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/config/routes/routes.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/local/local_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/widgets/post_item.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({super.key});

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {

  @override
  void initState() {
    BlocProvider.of<LocalPostBloc>(context).add(const GetSavedPosts());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
      ),
      body: BlocBuilder<LocalPostBloc, LocalPostState>(
          builder: ((context, state) {
        if (state is LocalPostsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LocalPostsDone) {
          if (state.posts!.isEmpty) {
    return const Center(
        child: Text(
      'NO SAVED POSTS',
      style: TextStyle(fontSize: 20),
    ),);
    }
          return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                return PostItem(
                  postEntity: state.posts![index],
                  onPostPressed: _onPostPressed,
                  onRemove:  _onRemovePost,
                  isRemovable: true,
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

  void _onRemovePost(PostEntity post) {
    BlocProvider.of<LocalPostBloc>(context).add(RemovePost(post));
  }

  void _onPostPressed(PostEntity post) {
    Navigator.pushNamed(context, AppRouteNames.postDetail, arguments: post);
  }
}
