import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/config/theme/app_themes.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/pages/home/posts_page.dart';
import 'package:my_clean_app/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePostBloc>(
      create: (context) => sl()..add(const GetPosts()),
      child: MaterialApp(
        theme: theme(),
        home: const PostPage(),
        debugShowCheckedModeBanner: false,
      ),
        
    );
  }
}
