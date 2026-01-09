import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blog/core/error/exception.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_state.dart';

import '../../../../../core/common/common_methods.dart';
import '../../../domain/usecases/user_sign_in.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserSignIn _userSignIn;

  SignInBloc({required UserSignIn userSignIn})
    : _userSignIn = userSignIn,
      super(SignInInitialState()) {
    on<SignInUserEvent>(onSignInSubmitted);
  }

  void onSignInSubmitted(
    SignInUserEvent event,
    Emitter<SignInState> emit,
  ) async {
    log('Email ${event.email}');
    if (event.email == null || event.email!.isEmpty) {
      emit(SignInErrorState('Please enter valid email'));
      emit(SignInResetState());
    } else if (!isValidEmail(event.email!)) {
      emit(SignInErrorState('Please enter valid email'));
      emit(SignInResetState());
    } else if (event.password == null || event.password!.isEmpty) {
      emit(SignInErrorState('Please enter password'));
      emit(SignInResetState());
    } else {
      emit(SignInLoadingState());
      await signInUser(
        email: event.email ?? '',
        password: event.password ?? '',
        emit: emit,
      );
    }
  }

  Future<void> signInUser({
    required String email,
    required String password,
    required Emitter emit,
  }) async {
    var res = await _userSignIn(
      UserSignInParams(email: email, password: password),
    );

    res.fold(
      (failure) {
        emit(SignInFailureState(failure.message));
        log('failure.message=>${failure.message}');
      },
      (user) {
        emit(SignInSuccessState());
      },
    );
  }
}
