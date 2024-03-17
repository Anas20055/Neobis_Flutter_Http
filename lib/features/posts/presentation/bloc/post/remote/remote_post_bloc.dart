import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_app/core/resourses/data_state.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:dio/dio.dart';
import 'package:my_clean_app/features/posts/domain/usecases/get_post.dart';

part 'remote_post_event.dart';
part 'remote_post_state.dart';

class RemotePostBloc extends Bloc<RemotePostEvent, RemotePostState> {

  final GetPostUseCase _getPostUseCase;
  RemotePostBloc(this._getPostUseCase) : super(const RemotePostsLoading()) {
    on<GetPosts>(onGetPosts);
  }
  void onGetPosts(GetPosts event,Emitter<RemotePostState> emit)async{
    final dataState = await _getPostUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemotePostsDone(dataState.data!));
    }
    if(dataState is DataFailed ){
      print("${dataState.error} 1111" );

      emit(RemotePostsError(dataState.error!));
    }
  }
}
