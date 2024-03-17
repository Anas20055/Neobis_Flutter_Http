import 'package:floor/floor.dart';
import 'package:my_clean_app/features/posts/data/models/post.dart';


@dao
abstract class PostDao{
  @Insert()
  Future<void> insertPost (PostModel post);

  @delete
  Future<void> deletePost(PostModel postModel);

  @Query('SELECT * FROM post')
  Future<List<PostModel>> getPosts();
}