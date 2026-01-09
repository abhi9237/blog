import 'dart:io';

import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final File? image;

  const SignUpState({this.image});
  SignUpState copyWith({File? image, String? username}) {
    return SignUpState(image: image ?? this.image);
  }

  @override
  List<Object?> get props => [image];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpFailedState extends SignUpState {}

class SignUpUserAuthenticatedState extends SignUpState {}

class UserImageSelectState extends SignUpState {}

class UserImageSelectFailedState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String message;
  const SignUpSuccessState(this.message);
}

class SignUpFailure extends SignUpState {
  final String message;
  const SignUpFailure(this.message);
}
