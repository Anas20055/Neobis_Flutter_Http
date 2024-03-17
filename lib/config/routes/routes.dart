import 'package:flutter/material.dart';
import 'package:my_clean_app/features/posts/domain/entities/post.dart';
import 'package:my_clean_app/features/posts/presentation/pages/home/posts_page.dart';
import 'package:my_clean_app/features/posts/presentation/pages/post_detail/post_detail.dart';
import 'package:my_clean_app/features/posts/presentation/pages/saved_posts/saved_posts.dart';

abstract class AppRouteNames{
  static const postDetail = 'post_detail';
  static const mainScreen = '/';
  static const savedPosts = '/saved_posts';
}



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.mainScreen:
        return _materialRoute(const PostPage());

      case AppRouteNames.postDetail:
        return _materialRoute(PostDetail(post: settings.arguments as PostEntity));

      case AppRouteNames.savedPosts:
        return _materialRoute(const SavedPosts());
        
      default:
        return _materialRoute(const PostPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}