import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/common/failure.dart';

abstract interface class UploadBlogRepo {
  Future<Either<Failure, String>> uploadBlog({
    required File image,
    required String title,
    required List selectedCategory,
    required bool isBlogVisible,
    required String blogContent,
  });
}
