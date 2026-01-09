import 'dart:io';

import 'package:blog/core/common/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required File image,
  });

  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> uploadUserProfile({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> uploadUserImage({
    required File image,
  });
}
