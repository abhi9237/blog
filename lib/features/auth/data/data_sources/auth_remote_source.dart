import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/common/toast.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/exception/server_exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String email,
    required String name,
    required String password,
    required File image,
  });

  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return response.user!.id;
      } else {
        throw ServerException('Login failed: User is null');
      }
    } on AuthException catch (e) {
      log('Login AuthException==> ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      log('Login Error==> ${e.toString()}');
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String email,
    required String name,
    required String password,
    required File image,
  }) async
  {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      if (response.user != null) {
        await insertUserImage(file: image,userID: response.user?.id ??'');
        return response.user!.id;
      } else {
        // This case might indicate email confirmation is required.
        log('SignUp Response==> ${response.toString()}');
        throw ServerException('Sign up failed: User is null after creation.');
      }
    } on AuthException catch (e) {
      log('SignUp AuthException==> ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      log('SignUp Error==> ${e.toString()}');
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(e.toString());
    }
  }

  Future<void> insertUserImage({required File file,required String userID}) async
  {
    try {
    log('userID==>$userID');


      final path = '$userID/avatar'; // MUST MATCH POLICY
      log('path==>$path');
      log('file==>$file');

      await supabaseClient.storage.from('profile_images').upload(
        path,
        file,
        fileOptions: const FileOptions(
          upsert: true,
          contentType: 'image/png',
        ),
      );
    } on StorageException catch (e) {
      log('StorageException ==> ${e.message}');
      rethrow;
    } catch (e) {
      log('Image Upload Error ==> $e');
      rethrow;
    }
  }

}
