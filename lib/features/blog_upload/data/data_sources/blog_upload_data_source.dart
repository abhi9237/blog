import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exception.dart';

abstract interface class BlogUploadDataSources {
  Future<String> uploadBlog({
    required File image,
    required String title,
    required List selectedCategory,
    required bool isBlogVisible,
    required String blogContent,
  });
}

class BlogUploadDataSourcesImpl extends BlogUploadDataSources {
  final SupabaseClient supabaseClient;
  BlogUploadDataSourcesImpl({required this.supabaseClient});

  @override
  Future<String> uploadBlog({
    required File image,
    required String title,
    required List selectedCategory,
    required bool isBlogVisible,
    required String blogContent,
  }) async

  {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) throw Exception('User not logged in');

      final imagePath =
          '${user.id}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      await supabaseClient.storage.from('blog_images').upload(imagePath, image);

      final imageUrl = supabaseClient.storage
          .from('blog_images')
          .getPublicUrl(imagePath);

      /// 2. Insert blog data
      final data = await supabaseClient.from('blogs').insert({
        'user_id': user.id,
        'title': title,
        'content': blogContent,
        'category': selectedCategory,
        'image_url': imageUrl,
        'is_public': isBlogVisible,
      });
      return '';
    } on StorageException catch (e) {
      log('StorageException ==> ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      log('Image Upload Error ==> $e');
      log('SignUp Error==> ${e.toString()}');
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(e.toString());
    }
  }

}
