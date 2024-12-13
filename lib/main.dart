import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/theme/app_theme.dart';
import 'features/posts/presentation/bloc/create_delete_update/create_delete_update_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/post_home_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<CreateDeleteUpdateBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const PostsHomeScreen(),
      ),
    );
  }
}
