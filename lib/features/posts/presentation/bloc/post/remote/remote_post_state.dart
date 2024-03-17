part of 'remote_post_bloc.dart';

abstract class RemotePostState extends Equatable {
  final List<PostEntity>? posts;
  final DioException? error;

  const RemotePostState({this.posts,this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [posts!,error!];
}

class RemotePostsLoading extends RemotePostState{
  const RemotePostsLoading();
}

class RemotePostsDone extends RemotePostState{
  const RemotePostsDone(List<PostEntity> post):super(posts: post);
}

class RemotePostsError extends RemotePostState{
  const RemotePostsError(DioException error):super(error: error);
}
