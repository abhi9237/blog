import 'dart:io';

import 'package:blog/core/common/failure.dart';
import 'package:blog/core/error/exception.dart';
import 'package:blog/features/auth/data/data_sources/auth_remote_source.dart';
import 'package:blog/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.logInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      final response = await remoteDataSource.signUpWithEmailPassword(
        email: email,
        name: name,
        password: password,
        image: image,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> uploadUserProfile({
    required String name,
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadUserImage({required File image}) async {
    try {
      throw UnimplementedError();
      // final response = await remoteDataSource.insertUserImage(
      //   file: image,
      //   userId: userId,
      // );
      // return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
