import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/features/auth/register/presentation/register_screen.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:milk_ride_live_wc/features/splash/presentation/splash_screen.dart';

class AppRoutesPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutesNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutesNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutesNames.registerScreen,
      page: () => RegisterScreen(),
    )
  ];
}
