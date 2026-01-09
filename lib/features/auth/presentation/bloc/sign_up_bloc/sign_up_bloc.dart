import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blog/core/common/common_methods.dart';
import 'package:blog/core/common/toast.dart';
import 'package:blog/core/error/exception.dart';
import 'package:blog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog/features/auth/presentation/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:blog/features/auth/presentation/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:image_picker/image_picker.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserSignUp _userSignUp;
  final imagePicker = ImagePicker();

  SignUpBloc({required UserSignUp userSignUp})
    : _userSignUp = userSignUp,
      super(SignUpInitialState()) {
    on<SignUpUserEvent>(signUpUser);
    on<SignUpUserImageUploadEvent>(pickImage);
  }

  void signUpUser(SignUpUserEvent e, Emitter emit) async {
    if (e.image == null) {
      showToastMessage(e.context, 'Please select your image');
    } else if (e.name.isEmpty) {
      showToastMessage(e.context, 'Please enter your name');
    } else if (e.email.isEmpty || !isValidEmail(e.email)) {
      showToastMessage(e.context, 'Please enter your valid email');
    } else if (e.password.isEmpty) {
      showToastMessage(e.context, 'Please enter your password');
    } else {
      emit(SignUpLoadingState());
      log('e.image===>${e.image}');
      final res = await _userSignUp(
        UserSignUpParams(
          email: e.email,
          password: e.password,
          name: e.name,
          image: e.image!,
        ),
      );

      res.fold(
        (failure) {
          emit(SignUpFailure(failure.message));
          showToastMessage(e.context, failure.message);
          log('failure.message=>${failure.message}');
        },
        (user) {
          emit(SignUpSuccessState(user));
        },
      );
    }
  }

  Future<void> pickImage(SignUpUserImageUploadEvent e, Emitter emit) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      emit(SignUpState(image: File(pickedFile.path) ));
      // emit(state.copyWith(image: File(pickedFile.path)));
    } else {
      emit(UserImageSelectFailedState());
    }
  }
}
