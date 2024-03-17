import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/core/usecases/usecase.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';

class GetPostUseCase implements UseCases<DataState<List<PostEntity>>,void> {
  final PostRepository _postRepository;

  GetPostUseCase(this._postRepository);
  @override
  Future<DataState<List<PostEntity>>> call({void params}) {
    return _postRepository.getPost();
  }

}