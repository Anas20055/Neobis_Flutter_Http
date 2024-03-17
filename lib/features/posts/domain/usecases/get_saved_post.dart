import 'package:my_clean_app/core/usecases/usecase.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';

class GetSavedPostUseCase implements UseCases<List<PostEntity>,void> {
  final PostRepository _postRepository;

  GetSavedPostUseCase(this._postRepository);
  @override
  Future<List<PostEntity>> call({void params}) {
    return _postRepository.getSavedPost();
  }

}