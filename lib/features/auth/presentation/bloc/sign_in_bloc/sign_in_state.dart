import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {
  final String message;
  SignInFailureState(this.message);
}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState(this.message);
}

class SignInResetState extends SignInState {}

class SignInUserAuthenticatedState extends SignInState {
  final String message;
  SignInUserAuthenticatedState(this.message);
}
