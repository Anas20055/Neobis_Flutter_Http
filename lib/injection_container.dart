import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:my_clean_app/features/posts/data/data_sources/local/app_database.dart';
import 'package:my_clean_app/features/posts/data/data_sources/remote/post_api_service.dart';
import 'package:my_clean_app/features/posts/data/repository/post_repository_impl.dart';
import 'package:my_clean_app/features/posts/domain/repository/post_repository.dart';
import 'package:my_clean_app/features/posts/domain/usecases/get_post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/get_saved_post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/remove_post.dart';
import 'package:my_clean_app/features/posts/domain/usecases/save_post.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/local/local_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies()async{
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<PostApiService>(PostApiService(sl()));
  sl.registerSingleton<PostRepository>(PostRepositoryImpl(sl(),sl()));
  sl.registerSingleton<GetPostUseCase>(GetPostUseCase(sl()));
  sl.registerSingleton<GetSavedPostUseCase>(GetSavedPostUseCase(sl()));
  sl.registerSingleton<SavePostUseCase>(SavePostUseCase(sl()));
  sl.registerSingleton<RemovePostUseCase>(RemovePostUseCase(sl()));
  sl.registerSingleton<RemotePostBloc>(RemotePostBloc(sl()));
  sl.registerSingleton<LocalPostBloc>(LocalPostBloc(sl(),sl(),sl()));
}