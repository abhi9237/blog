import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../model/blog_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<BlogModel>> getBlocs();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient supabaseClient;

  const HomeRemoteDataSourceImpl({required this.supabaseClient});


  @override
  Future<List<BlogModel>> getBlocs() async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .select();

      log(
        'Supabase blogs response: $response',
        name: 'HomeRemoteDataSource',
      );

      // ✅ Convert Map → BlogModel
      return (response as List)
          .map((json) => BlogModel.fromJson(json as Map<String, dynamic>))
          .toList();

    } catch (e, stackTrace) {
      log(
        'Error fetching blogs from Supabase',
        name: 'HomeRemoteDataSource',
        error: e,
        stackTrace: stackTrace,
      );

      throw Exception('Failed to fetch blogs');
    }
  }


}
