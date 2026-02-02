import 'package:fpdart/fpdart.dart';

import '../../../../core/common/failure.dart';
import '../../../../core/error/exception.dart';
import '../../../../model/blog_model.dart';
import '../../domain/repository/home_repo.dart';
import '../data_sources/home_remote_source.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImplementation({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BlogModel>>> getBlogs() async {
    try {
      final response = await homeRemoteDataSource.getBlocs();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
