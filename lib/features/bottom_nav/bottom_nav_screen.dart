import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen.dart';
import 'package:milk_ride_live_wc/features/order/presentation/order_screen.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/subscription_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavScreen extends StatefulWidget {
  final dynamic getArgument;
  const BottomNavScreen({super.key, this.getArgument});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    int initialIndex = 0;
    final args = Get.arguments;
    if (args != null &&
        args is Map &&
        args[ArgumentKey.selectedIndex] != null) {
      initialIndex = args[ArgumentKey.selectedIndex];
    }

    _controller = PersistentTabController(initialIndex: initialIndex);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const Scaffold(body: Center(child: Text("Products"))),
      Builder(builder: (context) => OrderScreen()),
      Builder(builder: (context) => SubscriptionScreen()),
      SizedBox()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      bottomBarItem(title: AppString.home, icon: AppIcons.home),
      bottomBarItem(title: AppString.product, icon: AppIcons.productIcons),
      bottomBarItem(title: AppString.order, icon: AppIcons.order),
      bottomBarItem(
          title: AppString.subscription, icon: AppIcons.subscriptions),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.cart),
        title: AppString.cart,
        textStyle: TextStyle(
          color: AppColors.bottomIconTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: AppString.fontFamily,
          fontSize: AppTextSize.s12,
        ),
        activeColorPrimary: AppColors.bottomIconTextColor,
        inactiveColorPrimary: AppColors.bottomIconTextColor,
        onPressed: (context) {
          Get.toNamed(AppRoutesNames.cartScreen);
        },
      ),
    ];
  }

  PersistentBottomNavBarItem bottomBarItem({
    required String title,
    required IconData icon,
  }) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: title,
      textStyle: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: AppString.fontFamily,
        fontSize: AppTextSize.s12,
      ),
      activeColorPrimary: AppColors.bottomIconTextColor,
      inactiveColorPrimary: AppColors.bottomIconTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: AppColors.primaryLightColor,
      navBarStyle: NavBarStyle.style4,
    );
  }
}
