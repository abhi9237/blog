import 'package:blog/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:blog/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/data/data_sources/auth_remote_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repo.dart';
import '../../features/auth/domain/usecases/user_sign_up.dart';
import '../secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supaBaseUrl,
    anonKey: AppSecrets.anonKey,
  );

  serviceLocator.registerSingleton<SupabaseClient>(supabase.client);

  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
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
}
