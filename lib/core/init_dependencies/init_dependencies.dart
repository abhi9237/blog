import 'package:blog/core/secure_storage/secure_storage.dart';
import 'package:blog/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:blog/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/data/data_sources/auth_remote_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repo.dart';
import '../../features/auth/domain/usecases/user_sign_up.dart';
import '../../features/blog_upload/data/data_sources/blog_upload_data_source.dart';
import '../../features/blog_upload/data/repository/blog_upload_repository_impl.dart';
import '../../features/blog_upload/domian/repository/upload_blog_repo.dart';
import '../../features/blog_upload/domian/usecases/upload_blog_usecase.dart';
import '../../features/blog_upload/presentation/bloc/upload_blog_bloc.dart';
import '../../features/home/data/data_sources/home_remote_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repository/home_repo.dart';
import '../../features/home/domain/usecase/home_case.dart';
import '../secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    anonKey: AppSecrets.anonKey,
  );

  serviceLocator.registerSingleton<SupabaseClient>(supabase.client);
  serviceLocator.registerSingleton<SecureStorageService>(
    SecureStorageService(),
  );

  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
      secureStorageService: serviceLocator<SecureStorageService>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImplementation(serviceLocator()),
  );

  serviceLocator.registerFactory<UserSignUp>(
    () => UserSignUp(serviceLocator()),
  );

  serviceLocator.registerFactory<UserSignIn>(
    () => UserSignIn(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => SignUpBloc(userSignUp: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => SignInBloc(userSignIn: serviceLocator()),
  );

  serviceLocator.registerFactory<BlogUploadDataSources>(
    () => BlogUploadDataSourcesImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator.registerFactory<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
    ),
  );
  serviceLocator.registerFactory<HomeRepository>(
        () => HomeRepositoryImplementation(homeRemoteDataSource: serviceLocator()),
  );


  serviceLocator.registerFactory<UploadBlogRepo>(
    () => BlogUploadImplementation(serviceLocator()),
  );

  serviceLocator.registerFactory<UploadBlogUseCase>(
        () => UploadBlogUseCase(serviceLocator()),
  );

  serviceLocator.registerFactory<HomeCase>(
    () => HomeCase(serviceLocator()),
  );

  serviceLocator.registerFactory<UploadBlogBloc>(
    () => UploadBlogBloc(uploadBlogUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<HomeBloc>(
        () => HomeBloc(serviceLocator()),
  );
}
