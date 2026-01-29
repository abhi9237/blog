import 'dart:io';

class UploadBlog {
  final String title;
  final String content;
  final List<String> category;
  final bool isPublic;
  final File image;

  UploadBlog({
    required this.title,
    required this.content,
    required this.category,
    required this.isPublic,
    required this.image,
  });
}
