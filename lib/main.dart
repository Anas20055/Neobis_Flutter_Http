import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_app/config/routes/routes.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/local/local_post_bloc.dart';
import 'package:my_clean_app/features/posts/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:my_clean_app/injection_container.dart';
part 'config/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemotePostBloc>(
          create: (context) => sl<RemotePostBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<LocalPostBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: _theme(),
        initialRoute: AppRouteNames.mainScreen,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
