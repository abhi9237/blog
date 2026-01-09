import 'package:blog/core/common/failure.dart';
import 'package:blog/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';
import '../repository/auth_repo.dart';

class UserSignIn implements UseCase<String, UserSignInParams> {
  final AuthRepository authRepository;

  const UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }

  @override
  Future<Either<Failure, String>> uploadImage(UserSignInParams params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadUserProfile(UserSignInParams params) {
    throw UnimplementedError();
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
