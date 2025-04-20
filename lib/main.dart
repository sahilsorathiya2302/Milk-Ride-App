import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_pages.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/area/area_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/regions_and_sources/regions_sources_cubit.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/place_order/place_order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories/categories_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/categories_products/categories_product_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription_cubit.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

import 'features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

void main() async {
  await GetStorage.init();
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
          BlocProvider<SubscriptionCubit>(
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
        ],
        child: GlobalLoaderOverlay(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Milk Ride',
            theme: ThemeData(
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
