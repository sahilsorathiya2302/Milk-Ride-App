import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/otp_screen.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/sign_in_screen.dart';
import 'package:milk_ride_live_wc/features/bottom_nav/bottom_nav_screen.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cart_screen.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/success_widgets.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen.dart';
import 'package:milk_ride_live_wc/features/order/presentation/order_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories/view_categories_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/categories_products_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/product_details_screen.dart';
import 'package:milk_ride_live_wc/features/splash/presentation/splash_screen.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/subscription_screen.dart';

import '../../features/auth/presentations/register/register_screen.dart';

class AppRoutesPages {
  AppRoutesPages._();

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
    GetPage(
      name: AppRoutesNames.productDetails,
      page: () => ProductDetailsScreen(
        getArgument: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.subscriptionScreen,
      page: () => SubscriptionScreen(
        subscriptionItemArgument: Get.arguments,
      ),
    ),
    GetPage(
        name: AppRoutesNames.cartScreen,
        page: () => CartScreen(),
        arguments: Get.arguments),
    GetPage(
      name: AppRoutesNames.bottomNavScreen,
      page: () => BottomNavScreen(),
    ),
    GetPage(
      name: AppRoutesNames.successScreen,
      page: () => SuccessWidgets(),
    ),
    GetPage(
      name: AppRoutesNames.orderScreen,
      page: () => OrderScreen(),
    ),
  ];
}
