import 'package:blog/features/auth/presentation/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:blog/features/auth/presentation/pages/signin.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/common_button.dart';
import '../../../../core/common/common_text_form_filled.dart';
import '../../../../core/common/custom_route.dart';
import '../../../../core/theme/color_constant.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../bloc/sign_up_bloc/sign_up_event.dart';
import '../widgets/camera_image_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up.',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CameraImageWidget(
                      onTapCamera: () {
                        context.read<SignUpBloc>().add(
                          SignUpUserImageUploadEvent(),
                        );
                      },
                      image: state.image,
                    ),

                    CommonTextFormFilled(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    CommonTextFormFilled(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    CommonTextFormFilled(
                      hintText: 'Password',
                      controller: passWordController,
                      isObscureText: true,
                    ),
                    SizedBox(height: 20),
                    state is SignUpLoadingState
                        ? CircularProgressIndicator(
                            color: ColorConstant.pinkColor,
                          )
                        : CommonButton(
                            buttonText: 'Sign up',
                            onTap: () {
                              context.read<SignUpBloc>().add(
                                SignUpUserEvent(
                                  image: state.image,
                                  context: context,
                                  email: emailController.text.trim(),
                                  name: nameController.text.trim(),
                                  password: passWordController.text.trim(),
                                ),
                              );
                            },
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account? ",
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
                            ).push(AppRoute.goRoute(SignInScreen()));
                          },
                          child: Text(
                            'Sign in.',
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
          ),
        );
      },
    );
  }
}
