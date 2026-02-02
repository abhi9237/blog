import 'dart:developer';

import 'package:blog/config/route_constant/route_constant.dart';
import 'package:blog/core/common/custom_route.dart';
import 'package:blog/core/init_dependencies/init_dependencies.dart';
import 'package:blog/core/secure_storage/secure_storage.dart';
import 'package:blog/core/theme/color_constant.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_state.dart';
import 'package:blog/features/auth/presentation/pages/signup.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/common/common_button.dart';
import '../../../../core/common/common_text_form_filled.dart';
import '../../../../core/common/toast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  bool isLoading = false;
  final supabase = serviceLocator<SupabaseClient>();

  updateLoader() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void initLogin() {
    final session = supabase.auth.currentSession;
    if (session != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.push(RouteConstant.dashboard);
      });
    } else {
      showToastMessage(context, 'Session Expired Please login');
    }
  }

  @override
  void initState() {
    super.initState();
    initLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        log('State${state}');
        if (state is SignInErrorState) {
          showToastMessage(context, state.message);
        }
        if (state is SignInLoadingState) {
          updateLoader();
        }
        if (state is SignInSuccessState) {
          updateLoader();
          showToastMessage(context, 'Login Success');
        }

        if (state is SignInFailureState) {
          updateLoader();
          showToastMessage(context, state.message);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign in.',
                style: TextStyle(
                  color: ColorConstant.whiteColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonTextFormFilled(
                hintText: 'Email',
                controller: emailController,
              ),
              CommonTextFormFilled(
                hintText: 'Password',
                controller: passWordController,
              ),

              SizedBox(height: 20),

              isLoading
                  ? CircularProgressIndicator(color: ColorConstant.pinkColor)
                  : CommonButton(
                      buttonText: 'Sign in',
                      onTap: () {
                        context.read<SignInBloc>().add(
                          SignInUserEvent(
                            passWordController.text,
                            emailController.text,
                            context,
                          ),
                        );
                      },
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                    style: TextStyle(
                      color: ColorConstant.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(AppRoute.goRoute(SignUpScreen()));
                    },
                    child: Text(
                      'Sign up.',
                      style: TextStyle(
                        color: ColorConstant.lightPinkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
