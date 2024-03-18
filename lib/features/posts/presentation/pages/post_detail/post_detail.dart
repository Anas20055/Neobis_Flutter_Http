import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/local/local_post_bloc.dart';

class PostDetail extends StatelessWidget {
  final PostEntity? post;
  const PostDetail({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: post!.id! % 3 == 0
                ? AppColors.gradient3
                : post!.id! % 3 == 1
                    ? AppColors.gradient1
                    : AppColors.gradient2,
            width: 5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post?.userId.toString() ?? 'wwwww',
            ),
            Text(post?.id.toString() ?? 'wwwww'),
            Text(
              post?.title ?? 'wwwww',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(post?.body ?? 'wwwww'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>_onFloatingActionButtonPressed(context),
        child: const Icon(Icons.bookmark),
        ),
    );
  }
  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalPostBloc>(context).add(SavePost(post!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Post saved successfully.'),
      ),
    );
  }
}
