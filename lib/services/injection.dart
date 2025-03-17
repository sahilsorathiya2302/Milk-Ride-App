import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/repositories/sign_up_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/repositories/sign_up_repository_Impl.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/usecase/post_sign_up_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:milk_ride_live_wc/services/auth_api_service.dart';

GetIt getIt = GetIt.instance;

void setLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<AuthApiService>(AuthApiService(getIt()));
  getIt.registerLazySingleton<SignUpRemoteRepo>(
    () => SignUpRemoteRepoImpl(authApiService: getIt()),
  );

  getIt.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImpl(signUpRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => PostSignUpUseCase(signUpRepository: getIt()),
  );

  getIt.registerFactory(
    () => SignUpCubit(signUpUseCase: getIt()),
  );
}
