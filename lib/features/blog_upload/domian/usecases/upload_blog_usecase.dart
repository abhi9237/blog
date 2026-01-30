import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/common/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/upload_blog_repo.dart';

class UploadBlogUseCase implements UseCase<String, UploadBlogParams> {
  final UploadBlogRepo uploadBlogRepo;

  const UploadBlogUseCase(this.uploadBlogRepo);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await uploadBlogRepo.uploadBlog(
      image: params.image,
      title: params.title,
      selectedCategory: params.category,
      isBlogVisible: params.isPublic,
      blogContent: params.content,
    );
  }

  @override
  Future<Either<Failure, String>> uploadImage(UploadBlogParams params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadUserProfile(UploadBlogParams params) {
    throw UnimplementedError();
  }
}

class UploadBlogParams {
  final String title;
  final String content;
  final List<String> category;
  final bool isPublic;
  final File image;
  UploadBlogParams({
    required this.title,
    required this.content,
    required this.category,
    required this.isPublic,
    required this.image,
  });
}
