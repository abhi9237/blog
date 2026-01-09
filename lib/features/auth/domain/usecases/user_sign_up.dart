import 'dart:io';

import 'package:blog/core/common/failure.dart';
import 'package:blog/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';

import '../repository/auth_repo.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
      image: params.image,
    );
  }

  @override
  Future<Either<Failure, String>> uploadImage(UserSignUpParams params) async {
    return await authRepository.uploadUserImage(
      image: params.image
    );
  }

  @override
  Future<Either<Failure, String>> uploadUserProfile(UserSignUpParams params) {
    throw UnimplementedError();
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  final File image;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
    required this.image,

  });
}
