import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/auth_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/auth_impl_repository.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/area_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/regions_sources_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/register_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_cubit.dart';
import 'package:milk_ride_live_wc/features/home/data/repositories/home_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/home/data/repositories/home_repository_impl.dart';
import 'package:milk_ride_live_wc/features/home/domain/repositories/home_repository.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/product/data/repositories/product_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/product/data/repositories/product_impl_repository.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/view_category_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product/product_cubit.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_cubit.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../features/auth/domain/usecases/otp_use_case.dart';
import '../features/auth/presentations/cubit/auth/auth_cubit.dart';
import '../features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';

GetIt getIt = GetIt.instance;

void setLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(getIt()));

  getIt.registerLazySingleton<AuthRemoteRepo>(
    () => AuthImplRemoteRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthImplRepository(authRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => SignInUseCase(authRepository: getIt()),
  );

  getIt.registerLazySingleton<OtpUseCase>(
    () => OtpUseCase(authRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => ResendOtpUseCase(authRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => RegisterUseCase(authRepository: getIt()),
  );
  getIt.registerFactory(
    () => AuthCubit(
      registerUseCase: getIt(),
      signInUseCase: getIt(),
      otpUseCase: getIt(),
      resendOtpUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => RegionsSourcesUseCase(authRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => AreaUseCase(authRepository: getIt()),
  );
  getIt.registerFactory(
    () => RegionsSourcesCubit(
      regionsSourcesUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => AreaCubit(areaUseCase: getIt()),
  );

  getIt.registerLazySingleton<HomeRemoteRepo>(
    () => HomeRemoteRepoImpl(apiService: getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => HomeUseCase(homeRepository: getIt()),
  );

  getIt.registerSingleton(HomeCubit(homeUseCase: getIt()));
  getIt.registerSingleton(SplashCubit());

  getIt.registerLazySingleton<ProductRemoteRepo>(
    () => ProductImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductImplRepository(productRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => ViewCategoryUseCase(productRepository: getIt()),
  );
  // getIt.registerSingleton(ViewCategoryCubit(viewCategoryUseCase: getIt()));

  getIt.registerLazySingleton(
    () => CategoriesProductUseCase(productRepository: getIt()),
  );
  getIt.registerSingleton(ProductCubit(
    categoriesProductUseCase: getIt(),
  ));
  getIt.registerSingleton(CategoriesCubit(viewCategoryUseCase: getIt()));
}
