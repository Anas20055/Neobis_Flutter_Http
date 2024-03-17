import 'package:flutter/material.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';

class PostItem extends StatelessWidget {
  final PostEntity postEntity;
  final Color color;
  final void Function(PostEntity postEntity) ? onPostPressed;
  const PostItem({
    super.key,
    required this.postEntity,
    required this.color, this.onPostPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                PostTitle(text: 'userId:${postEntity.userId}'),
                const SizedBox(width: 5),
                PostTitle(text: 'postId:${postEntity.id}'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              postEntity.title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              postEntity.body!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

   void _onTap() {
    if (onPostPressed != null) {
      onPostPressed!(postEntity);
    }
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }
}
