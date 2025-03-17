import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_pages.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

void main() {
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      child: BlocProvider<SignUpCubit>(
        create: (context) => getIt(),
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
