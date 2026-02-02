import 'package:fpdart/fpdart.dart';
import '../../../../core/common/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../model/blog_model.dart';
import '../repository/home_repo.dart';

class HomeCase implements HomeUseCase<List<BlogModel>, void> {
  final HomeRepository homeRepository;

  const HomeCase(this.homeRepository);
  @override
  Future<Either<Failure, List<BlogModel>>> call(params) async {
    return await homeRepository.getBlogs();
  }
}
