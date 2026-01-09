import 'package:blog/core/init_dependencies/init_dependencies.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'features/auth/presentation/pages/signin.ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<SignUpBloc>()),
        BlocProvider(create: (_) => serviceLocator<SignInBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog app',
      theme: AppTheme.darkTheme,
      home: const SignInScreen(),
    );
  }
}
