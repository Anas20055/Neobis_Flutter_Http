import 'dart:io';

import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/features/posts/data/data_sources/local/app_database.dart';
import 'package:my_clean_app/features/posts/data/data_sources/remote/post_api_service.dart';
import 'package:my_clean_app/features/posts/data/models/post.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl implements PostRepository{
  final PostApiService _postApiService;
  final AppDatabase _appDatabase;

  PostRepositoryImpl(this._postApiService, this._appDatabase);
  @override
  Future<DataState<List<PostModel>>> getPost() async {
    try {
  final httpResponce = await _postApiService.getPost();
  if(httpResponce.response.statusCode == HttpStatus.ok){
    return DataSuccess(httpResponce.data);
  }else{
    return DataFailed(
      DioException(
        error: httpResponce.response.statusMessage,
        response: httpResponce.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponce.response.requestOptions
      )
    );
  }
} on DioException catch (e) {
  return DataFailed(e);
}
  }

  @override
  Future<void> deletePost(PostEntity post) {
    return _appDatabase.postDAO.deletePost(PostModel.fromEntity(post));
  }

  @override
  Future<List<PostModel>> getSavedPost() {
   return _appDatabase.postDAO.getPosts();
  }

  @override
  Future<void> savePost(PostEntity post) {
    return _appDatabase.postDAO.insertPost(PostModel.fromEntity(post));
  }

}