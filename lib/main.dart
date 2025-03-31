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
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/splash/cubit/splash_cubit.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

void main() async {
  setLocator();
  await GetStorage.init();
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
        ],
        child: GlobalLoaderOverlay(
          child: GetMaterialApp(
            title: 'Flutter Demo',
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
