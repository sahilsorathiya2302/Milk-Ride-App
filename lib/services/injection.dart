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
import 'package:milk_ride_live_wc/features/cart/data/repositories/cart_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/cart/data/repositories/cart_impl_repository.dart';
import 'package:milk_ride_live_wc/features/cart/data/repositories/place_order_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/cart/data/repositories/place_order_impl_repository.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/cart_repository.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/place_order_repository.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_item_remove_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_quantity_update_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/place_order_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/place_order/place_order_cubit.dart';
import 'package:milk_ride_live_wc/features/create_subscription/data/repositories/create_subscription_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/create_subscription/data/repositories/create_subscription_impl_repository.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/repositories/create_subscription_repository.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/usecase/create_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/home/data/repositories/home_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/home/data/repositories/home_repository_impl.dart';
import 'package:milk_ride_live_wc/features/home/domain/repositories/home_repository.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/order/data/repositories/order_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/order/data/repositories/order_impl_repository.dart';
import 'package:milk_ride_live_wc/features/order/domain/repositories/order_repository.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_cancel_use_case.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_use_case.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_cubit.dart';
import 'package:milk_ride_live_wc/features/product/data/repositories/product_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/product/data/repositories/product_impl_repository.dart';
import 'package:milk_ride_live_wc/features/product/domain/repositories/product_repository.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/categories_product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/product_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/variants_use_case.dart';
import 'package:milk_ride_live_wc/features/product/domain/usecase/view_category_use_case.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/profile/data/repositories/profile_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/profile/data/repositories/profile_impl_repository.dart';
import 'package:milk_ride_live_wc/features/profile/domain/use_case/profile_use_case.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:milk_ride_live_wc/features/side_menu/data/repositories/vacation_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/side_menu/data/repositories/vacation_impl_repository.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/repositories/vacation_repository.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/use_case/vacation_use_case.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_cubit.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/data/repositories/subscription_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/subscription/data/repositories/subscription_impl_repository.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/delete_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/my_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/pause_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/resume_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/temp_change_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/update_permanent_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/pause_resume_cubit/pause_resume_sub_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/update_permanently/update_permanently_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/data/repositories/view_product_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/view_all_product/data/repositories/view_product_impl_repository.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/repositories/view_product_repository.dart';
import 'package:milk_ride_live_wc/features/view_all_product/domain/use_case/view_product_use_case.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/add_amount_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/add_amount_impl_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/wallet_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/wallet_impl_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/add_amount_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_cash_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_online_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/verify_payment_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/wallet_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet_history/data/repositories/history_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet_history/data/repositories/history_impl_repository.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/repositories/history_repository.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/recharge_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/billing_history/billing_history_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../features/auth/domain/usecases/otp_use_case.dart';
import '../features/auth/presentations/cubit/auth/auth_cubit.dart';
import '../features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';
import '../features/profile/domain/repositories/profile_repository.dart';

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

  getIt.registerLazySingleton(
    () => ProductUseCase(productRepository: getIt()),
  );
  getIt.registerSingleton(CategoriesProductCubit(
    categoriesProductUseCase: getIt(),
  ));
  getIt.registerSingleton(ProductDetailsCubit(
    productUseCase: getIt(),
  ));
  getIt.registerSingleton(CategoriesCubit(viewCategoryUseCase: getIt()));

  getIt.registerLazySingleton<CartRemoteRepo>(
    () => CartImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartImplRepository(cartRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => CartUseCase(cartRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => CartItemRemoveUseCase(cartRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => CartQuantityUpdateUseCase(cartRepository: getIt()),
  );
  getIt.registerSingleton(CartCubit(
    cartQuantityUpdateUseCase: getIt(),
    cartItemRemoveUseCase: getIt(),
    cartUseCase: getIt(),
  ));

  getIt.registerLazySingleton<CreateSubscriptionRemoteRepo>(
    () => CreateSubscriptionImplRemoteRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<CreateSubscriptionRepository>(
    () =>
        CreateSubscriptionImplRepository(createSubscriptionRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => CreateSubscriptionUseCase(createSubscriptionRepository: getIt()),
  );
  getIt.registerSingleton(CreateSubscriptionCubit(getIt()));
  getIt
      .registerLazySingleton(() => VariantsUseCase(productRepository: getIt()));
  getIt.registerSingleton(VariantsCubit(variantsUseCase: getIt()));
  getIt.registerLazySingleton<PlaceOrderRemoteRepo>(
    () => PlaceOrderImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<PlaceOrderRepository>(
    () => PlaceOrderImplRepository(placeOrderRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => PlaceOrderUseCase(placeOrderRepository: getIt()),
  );

  getIt.registerSingleton(PlaceOrderCubit(placeOrderUseCase: getIt()));

  getIt.registerLazySingleton<OrderRemoteRepo>(
    () => OrderImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<OrderRepository>(
    () => OrderImplRepository(orderRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => OrderUseCase(orderRepository: getIt()),
  );
  getIt.registerSingleton(OrderCubit(orderUseCase: getIt()));

  getIt.registerLazySingleton(
    () => OrderCancelUseCase(orderRepository: getIt()),
  );
  getIt.registerSingleton(OrderCancelCubit(orderCancelUseCase: getIt()));

  getIt.registerLazySingleton<SubscriptionRemoteRepo>(
    () => SubscriptionImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionImplRepository(subscriptionRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => SubscriptionUseCase(subscriptionRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => DeleteSubscriptionUseCase(subscriptionRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => PauseSubscriptionUseCase(subscriptionRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => ResumeSubscriptionUseCase(subscriptionRepository: getIt()),
  );
  getIt.registerSingleton(SubscriptionCubit(
    subscriptionUseCase: getIt(),
    deleteSubscriptionUseCase: getIt(),
  ));
  getIt.registerLazySingleton(
    () => TempChangeSubscriptionUseCase(subscriptionRepository: getIt()),
  );
  getIt.registerSingleton(
      ModifyTemporarilyCubit(tempChangeSubscriptionUseCase: getIt()));

  getIt.registerLazySingleton(
    () => UpdatePermanentUseCase(subscriptionRepository: getIt()),
  );

  getIt.registerSingleton(
      UpdatePermanentlyCubit(updatePermanentUseCase: getIt()));

  getIt.registerLazySingleton<WalletRemoteRepo>(
    () => WalletImplRemoteRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<WalletRepository>(
    () => WalletImplRepository(walletRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => WalletUseCase(walletRepository: getIt()),
  );
  getIt.registerSingleton(WalletCubit(walletUseCase: getIt()));
  getIt.registerSingleton(PauseResumeSubCubit(
      resumeSubscriptionUseCase: getIt(), pauseSubscriptionUseCase: getIt()));

  getIt.registerLazySingleton<AddAmountRemoteRepo>(
    () => AddAmountImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<AddAmountRepository>(
    () => AddAmountImplRepository(addAmountRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => PayCashUseCase(addAmountRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => PayOnlineUseCase(addAmountRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => VerifyPaymentUseCase(addAmountRepository: getIt()),
  );
  getIt.registerSingleton(AddBalanceCubit(
      payCashUseCase: getIt(),
      payOnlineUseCase: getIt(),
      verifyPaymentUseCase: getIt()));

  getIt.registerLazySingleton<HistoryRemoteRepo>(
    () => HistoryImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<HistoryRepository>(
    () => HistoryImplRepository(historyRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => BillingHistoryUseCase(historyRepository: getIt()),
  );

  getIt.registerSingleton(BillingHistoryCubit(billingHistoryUseCase: getIt()));

  getIt.registerLazySingleton(
    () => RechargeHistoryUseCase(historyRepository: getIt()),
  );

  getIt
      .registerSingleton(RechargeHistoryCubit(rechargeHistoryUseCase: getIt()));

  getIt.registerLazySingleton<ViewProductRemoteRepo>(
    () => ViewProductImplRemoteRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<ViewProductRepository>(
    () => ViewProductImplRepository(viewProductRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => ViewProductUseCase(viewProductRepository: getIt()),
  );

  getIt.registerSingleton(ViewAllProductCubit(viewProductUseCase: getIt()));
  getIt.registerSingleton(ViewAllProductCategoriesCubit());

  getIt.registerLazySingleton<ProfileRemoteRepo>(
    () => ProfileImplRemoteRepo(apiService: getIt()),
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileImplRepository(profileRemoteRepo: getIt()),
  );

  getIt.registerLazySingleton(
    () => ProfileUseCase(profileRepository: getIt()),
  );

  getIt.registerSingleton(ProfileCubit(profileUseCase: getIt()));

  getIt.registerLazySingleton<VacationRemoteRepo>(
    () => VacationImplRemoteRepo(apiService: getIt()),
  );
  getIt.registerLazySingleton<VacationRepository>(
    () => VacationImplRepository(vacationRemoteRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => VacationUseCase(vacationRepository: getIt()),
  );

  getIt.registerSingleton(VacationCubit(
    vacationUseCase: getIt(),
  ));
}
