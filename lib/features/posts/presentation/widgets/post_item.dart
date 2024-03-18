import 'package:flutter/material.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';

class PostItem extends StatelessWidget {
  final PostEntity postEntity;
  final Color color;
  final bool? isRemovable;
  final void Function(PostEntity postEntity)? onPostPressed;
  final void Function(PostEntity postEntity)? onRemove;
  const PostItem(
      {super.key,
      required this.postEntity,
      required this.color,
      this.onPostPressed,
      this.onRemove,
      this.isRemovable});

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
                PostTitle(child: Text('userId:${postEntity.userId}')),
                const SizedBox(width: 5),
                PostTitle(child: Text('postId:${postEntity.id}')),
                const SizedBox(width: 5),
                _buidButton()
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

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(postEntity);
    }
  }

  Widget _buidButton() {
    if (isRemovable ?? false) {
      return GestureDetector(
        onTap: _onRemove,
        child: const PostTitle(
          color: Colors.red,
          child: Icon(Icons.delete),
        ),
      );
    }
    return Container();
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    super.key,
    required this.child,
    this.color = Colors.black,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
