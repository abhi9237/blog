import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInUserEvent extends SignInEvent {
  final String? email;
  final String? password;
  final BuildContext? context;
  SignInUserEvent(this.password, this.email, this.context);
}
