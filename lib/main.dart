import 'package:blog/core/init_dependencies/init_dependencies.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:blog/features/blog_upload/presentation/pages/upload_blog.dart';
import 'package:blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/router/app_router.dart';
import 'core/observer/bloc_observer.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'features/auth/presentation/pages/signin.ui.dart';
import 'features/blog_upload/presentation/bloc/upload_blog_bloc.dart';
import 'features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'features/bottom_nav/presentation/pages/bottom_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<SignUpBloc>()),
        BlocProvider(create: (_) => serviceLocator<SignInBloc>()),
        BlocProvider(create: (_) => serviceLocator<UploadBlogBloc>()),
        BlocProvider(create: (_) => serviceLocator<HomeBloc>()),
        BlocProvider(create: (_) => BottomNavBloc()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Blog app',
      theme: AppTheme.darkTheme,
    );
  }
}
