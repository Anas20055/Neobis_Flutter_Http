part of 'remote_post_bloc.dart';

abstract class RemotePostEvent{
  const RemotePostEvent();
}

class GetPosts extends RemotePostEvent{
  const GetPosts();
}