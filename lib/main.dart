import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_pages.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/place_order/place_order_cubit.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_cubit.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/pause_resume_cubit/pause_resume_sub_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/update_permanently/update_permanently_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product/view_all_product_cubit.dart';
import 'package:milk_ride_live_wc/features/view_all_product/presentation/cubit/view_all_product_categories/view_all_product_categories_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/billing_history/billing_history_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

import 'features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

void main() async {
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  await getIt.reset(dispose: true);
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<RegionsSourcesCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<AreaCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<ProductDetailsCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<CategoriesProductCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<CartCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<CreateSubscriptionCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<VariantsCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<PlaceOrderCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<OrderCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<OrderCancelCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<SubscriptionCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<ModifyTemporarilyCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<UpdatePermanentlyCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<PauseResumeSubCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<AddBalanceCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<WalletCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<BillingHistoryCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<RechargeHistoryCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<ViewAllProductCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<ViewAllProductCategoriesCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => getIt(),
          ),
          BlocProvider<VacationCubit>(
            create: (context) => getIt(),
          ),
        ],
        child: GlobalLoaderOverlay(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Milk Ride',
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: AppColors.white),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: "/",
            getPages: AppRoutesPages.pages,
          ),
        ),
      ),
    );
  }
}
