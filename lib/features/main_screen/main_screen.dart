import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/features/home/presentation/home_screen.dart';
import 'package:milk_ride_live_wc/features/order/presentation/order_screen.dart';

import '../home/presentation/cubit/home_cubit.dart';
import '../side_menu/presentation/side_menu_screen.dart';
import '../subscription/presentation/subscription_screen.dart';
import '../view_all_product/view_all_product_show_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void jumpToHomeTab() {
    setState(() => _currentIndex = 0);
  }

  void jumpToTab(int index) {
    if (index == 4) {
      Get.toNamed(AppRoutesNames.cartScreen);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void initState() {
    context.read<HomeCubit>().getHome();
    super.initState();

    final args = Get.arguments;
    if (args != null && args[ArgumentKey.selectedIndex] != null) {
      int selectedIndex = args[ArgumentKey.selectedIndex];
      Future.delayed(Duration.zero, () {
        jumpToTab(selectedIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Widget> screens = [
      HomeScreen(
        scaffoldKey: scaffoldKey,
      ),
      ViewAllProductShowScreen(
        onBack: jumpToHomeTab,
      ),
      OrderScreen(
        onBack: jumpToHomeTab,
      ),
      SubscriptionScreen(
        onBack: jumpToHomeTab,
      ),
      SizedBox(),
    ];
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenuScreen(),
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 5 * _currentIndex +
                  (MediaQuery.of(context).size.width / 10 - 25),
              child: Container(
                height: 5.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 65.h,
                child: BottomNavigationBar(
                  backgroundColor: AppColors.primaryColor,
                  selectedLabelStyle: TextStyle(
                    fontFamily: AppString.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: AppTextSize.s11,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: AppString.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: AppTextSize.s11,
                  ),
                  currentIndex: _currentIndex,
                  onTap: jumpToTab,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.home),
                      label: AppString.home,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.productIcons),
                      label: AppString.product,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.order),
                      label: AppString.order,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.subscriptions),
                      label: AppString.subscription,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.cart),
                      label: AppString.cart,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
