import 'package:fpdart/fpdart.dart';

import '../../../../core/common/failure.dart';
import '../../../../model/blog_model.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<BlogModel>>> getBlogs();
}
