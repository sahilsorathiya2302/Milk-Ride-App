import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/otp_screen.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/sign_in_screen.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen/home_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories/view_categories_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/categories_products_screen.dart';
import 'package:milk_ride_live_wc/features/splash/presentation/splash_screen.dart';

import '../../features/auth/presentations/register/register_screen.dart';

class AppRoutesPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutesNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutesNames.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppRoutesNames.registerScreen,
      page: () => RegisterScreen(
        getArgument: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.otpScreen,
      page: () => OtpScreen(),
    ),
    GetPage(
      name: AppRoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutesNames.viewCategories,
      page: () => ViewCategoriesScreen(
        getArgument: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.categoryProduct,
      page: () => CategoriesProductsScreen(
        getArgument: Get.arguments,
      ),
    ),
  ];
}
