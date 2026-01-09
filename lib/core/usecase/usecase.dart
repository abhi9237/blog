import 'package:fpdart/fpdart.dart';
import '../common/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
  Future<Either<Failure, SuccessType>> uploadImage(Params params);
  Future<Either<Failure, SuccessType>> uploadUserProfile(Params params);
}
