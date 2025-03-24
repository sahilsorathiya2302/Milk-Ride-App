import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milk_ride_live_wc/features/auth/cubit/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/sign_in_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/sign_in_repository_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/otp_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/otp_repository_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/resend_otp_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/resend_otp_repository_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/otp_repository.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/resend_otp_repository.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/usecases/otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/usecases/resend_otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/usecase/sign_in_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/repositories/sign_up_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/repositories/sign_up_repository_Impl.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/usecase/post_sign_up_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

GetIt getIt = GetIt.instance;

void setLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(getIt()));
  getIt.registerLazySingleton<SignUpRemoteRepo>(
    () => SignUpRemoteRepoImpl(apiService: getIt()),
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

  getIt.registerLazySingleton<SignInRemoteRepo>(
    () => SignInRemoteRepoImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(signInRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => SignInUseCase(signInRepository: getIt()),
  );

  getIt.registerLazySingleton<OtpRemoteRepo>(
    () => OtpRemoteRepoImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<OtpRepository>(
    () => OtpRepositoryImpl(otpRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton<OtpUseCase>(
    () => OtpUseCase(otpRepository: getIt()),
  );

  getIt.registerLazySingleton<ResendOtpRemoteRepo>(
    () => ResendOtpRemoteRepoImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<ResendOtpRepository>(
    () => ResendOtpRepositoryImpl(resendOtpRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => ResendOtpUseCase(resendOtpRepository: getIt()),
  );

  getIt.registerFactory(
    () => AuthCubit(
        signInUseCase: getIt(), otpUseCase: getIt(), resendOtpUseCase: getIt()),
  );
}
