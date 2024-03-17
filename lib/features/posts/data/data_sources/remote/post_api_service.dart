import 'package:my_clean_app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:my_clean_app/features/posts/data/models/post.dart';
import 'package:retrofit/retrofit.dart';
part 'post_api_service.g.dart';
@RestApi(baseUrl: Constnats.jsonplaceholderBaseUrl)
abstract class PostApiService{
  factory PostApiService(Dio dio) = _PostApiService;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPost();
}