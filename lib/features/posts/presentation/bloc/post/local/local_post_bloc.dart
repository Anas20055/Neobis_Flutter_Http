import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/get_saved_post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/remove_post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/save_post.dart';

part 'local_post_event.dart';
part 'local_post_state.dart';

class LocalPostBloc extends Bloc<LocalPostEvent, LocalPostState> {
  final GetSavedPostUseCase _getSavedPostsUseCase;
  final SavePostUseCase _savePostUseCase;
  final RemovePostUseCase _removePostUseCase;
  LocalPostBloc(
    this._getSavedPostsUseCase,
    this._savePostUseCase,
    this._removePostUseCase,
  ) : super(const LocalPostsLoading()){
    on<GetSavedPosts>(onGetSavedPosts);
    on<RemovePost>(onRemovePost);
    on<SavePost>(onSavePost);
  }

  void onGetSavedPosts(GetSavedPosts event,Emitter<LocalPostState> emit)async{
    final posts = await _getSavedPostsUseCase();
    emit(LocalPostsDone(posts));
  }

  void onRemovePost(RemovePost removePost,Emitter<LocalPostState> emit)async{
    await _removePostUseCase(params: removePost.post);
    final posts = await _getSavedPostsUseCase();
    emit(LocalPostsDone(posts));
  }

  void onSavePost(SavePost savePost,Emitter<LocalPostState> emit)async{
    await _savePostUseCase(params: savePost.post);
    final posts = await _getSavedPostsUseCase();
    emit(LocalPostsDone(posts));
  }
}
