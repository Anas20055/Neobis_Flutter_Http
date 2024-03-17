import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';

abstract class PostRepository{
  Future<DataState<List<PostEntity>>> getPost();

  Future<List<PostEntity>> getSavedPost();

  Future<void> savePost(PostEntity post);

  Future<void> deletePost(PostEntity post);

}