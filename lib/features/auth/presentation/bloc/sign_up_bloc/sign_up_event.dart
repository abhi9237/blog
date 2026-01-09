import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final File? image;
  final BuildContext context;

  SignUpUserEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.context,
  });
}

class SignUpUserImageUploadEvent extends SignUpEvent {}
