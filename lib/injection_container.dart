import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:my_clean_app/features/posts/data/data_sources/remote/post_api_service.dart';
import 'package:my_clean_app/features/posts/data/repository/post_repository_impl.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';
import 'package:my_clean_app/features/posts/domain/usecases/get_post.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<PostApiService>(PostApiService(sl()));
  sl.registerSingleton<PostRepository>(PostRepositoryImpl(sl()));
  sl.registerSingleton<GetPostUseCase>(GetPostUseCase(sl()));
  sl.registerSingleton<RemotePostBloc>(RemotePostBloc(sl()));
}