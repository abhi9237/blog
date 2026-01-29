import 'dart:io';
import 'package:blog/core/common/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exception.dart';
import '../../domian/repository/upload_blog_repo.dart';
import '../data_sources/blog_upload_data_source.dart';

class BlogUploadImplementation implements UploadBlogRepo {
  final BlogUploadDataSources blogUploadDataSources;
  BlogUploadImplementation(this.blogUploadDataSources);

  @override
  Future<Either<Failure, String>> uploadBlog({
    required File image,
    required String title,
    required List selectedCategory,
    required bool isBlogVisible,
    required String blogContent,
  }) async {
    try {
      final response = await blogUploadDataSources.uploadBlog(
        image: image,
        title: title,
        selectedCategory: selectedCategory,
        isBlogVisible: isBlogVisible,
        blogContent: blogContent,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
