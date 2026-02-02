import 'dart:io';

import 'package:blog/core/common/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required File image,
  });

  Future<Either<Failure, AuthResponse>> logInWithEmailPassword({
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
