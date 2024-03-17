import 'dart:io';

import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/features/posts/data/data_sources/remote/post_api_service.dart';
import 'package:my_clean_app/features/posts/data/models/post.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl implements PostRepository{
  final PostApiService _postApiService;

  PostRepositoryImpl(this._postApiService);
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

}