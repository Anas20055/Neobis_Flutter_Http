part of 'local_post_bloc.dart';


abstract class LocalPostEvent extends Equatable {
  final PostEntity? post;
  const LocalPostEvent({this.post});

  @override
  List<Object> get props => [post!];
}


class GetSavedPosts extends LocalPostEvent{
  const GetSavedPosts();
}


class SavePost extends LocalPostEvent{
  const SavePost(PostEntity post):super(post: post);
}

class RemovePost extends LocalPostEvent{
  const RemovePost(PostEntity post):super(post: post);
}

