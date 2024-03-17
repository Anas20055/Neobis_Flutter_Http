part of 'local_post_bloc.dart';


abstract class LocalPostState extends Equatable {
  final List<PostEntity>? posts;

  const LocalPostState({this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => [posts!];
}

class LocalPostsLoading extends LocalPostState{
  const LocalPostsLoading();
}

class LocalPostsDone extends LocalPostState{
  const LocalPostsDone(List<PostEntity> post):super(posts: post);
}
