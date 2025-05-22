import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/otp_screen.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/sign_in_screen.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cart_screen.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/widgets/success_widgets.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/create_subscription_screen.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen.dart';
import 'package:milk_ride_live_wc/features/order/presentation/order_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories/view_categories_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/categories_products/categories_products_screen.dart';
import 'package:milk_ride_live_wc/features/product/presentation/product_details/product_details_screen.dart';
import 'package:milk_ride_live_wc/features/splash/presentation/splash_screen.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/subscription_screen.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/modify_widgets/update_permanently_widget.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/wallet_screen.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/billing_history/billing_history_screen.dart';
import 'package:milk_ride_live_wc/features/wallet_history/presentation/recharge_history/recharge_history_screen.dart';

import '../../features/auth/presentations/register/register_screen.dart';
import '../../features/main_screen/main_screen.dart';
import '../../features/subscription/presentation/widgets/modify_widgets/modify_temporarily_widget.dart';

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
      name: AppRoutesNames.createSubscriptionScreen,
      page: () => CreateSubscriptionScreen(
        subscriptionItemArgument: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.cartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
      name: AppRoutesNames.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutesNames.successScreen,
      page: () => SuccessWidgets(),
    ),
    GetPage(
      name: AppRoutesNames.orderScreen,
      page: () => OrderScreen(),
    ),
    GetPage(
      name: AppRoutesNames.subscriptionScreen,
      page: () => SubscriptionScreen(),
    ),
    GetPage(
      name: AppRoutesNames.modifyTemporarilyWidget,
      page: () => ModifyTemporarilyWidget(
        subscriptionData: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.updatePermanentlyWidget,
      page: () => UpdatePermanentlyWidget(
        subscriptionArgument: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesNames.walletScreen,
      page: () => WalletScreen(),
    ),
    GetPage(
      name: AppRoutesNames.rechargeHistoryScreen,
      page: () => RechargeHistoryScreen(),
    ),
    GetPage(
      name: AppRoutesNames.billingHistoryScreen,
      page: () => BillingHistoryScreen(),
    ),
    // GetPage(
    //   name: AppRoutesNames.viewAllProduct,
    //   page: () => ViewAllProductScreen(),
    // ),
  ];
}
