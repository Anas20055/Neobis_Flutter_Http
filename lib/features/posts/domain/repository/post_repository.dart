import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';

abstract class PostRepository{
  Future<DataState<List<PostEntity>>> getPost();
  
}