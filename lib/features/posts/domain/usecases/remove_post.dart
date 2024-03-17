import 'package:my_clean_app/core/usecases/usecase.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';

class RemovePostUseCase implements UseCases<void,PostEntity> {
  final PostRepository _postRepository;

  RemovePostUseCase(this._postRepository);
  @override
  Future<void> call({PostEntity? params}) {
    return _postRepository.deletePost(params!);
  }

}