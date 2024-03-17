import 'package:my_clean_app/features/posts/domain/entities/post.dart';

class PostModel extends PostEntity {
  const PostModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }): super(
    userId,
    id,
    title,
    body,
  );

  factory PostModel.fromJson(Map < String, dynamic > json) {
    return PostModel(
    userId : json['userId'],
    id :json['id'],
    title :json['title'],
    body : json['body'],
    );
  }
}
