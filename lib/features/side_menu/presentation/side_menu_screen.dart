import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/profile_screen.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/widgets/switch_widget.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/widgets/user_personal_details_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  late Future<String> _versionFuture;

  @override
  void initState() {
    _versionFuture = _getVersion();
    super.initState();
  }

  Future<String> _getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                final customer = state.homeResponse.data?.customer;
                if (customer == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    UserPersonalDetailsWidget(customer: customer),
                    SwitchWidget(),
                  ],
                );
              } else if (state is HomeError) {
                return Center(
                  child: CustomText(
                    text: state.failure,
                    fontWeight: FontWeight.w600,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          buildListTile(
            text: AppString.myProfile,
            icon: AppIcons.person,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              showProfileBottomSheet();
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.myPreference,
            icon: AppIcons.preference,
            onTap: () => Get.back(),
          ),
          Divider(),
          // buildListTile(
          //   text: AppString.myCart,
          //   icon: AppIcons.cart,
          //   onTap: () {
          //     Scaffold.of(context).closeDrawer();
          //     final customerId =
          //         StorageManager.readData(StorageKeys.customerId);
          //     Get.toNamed(AppRoutesNames.cartScreen, arguments: customerId);
          //   },
          // ),

          buildListTile(
            text: AppString.orderHistory,
            icon: AppIcons.orderCube,
            onTap: () {
              // Scaffold.of(context).closeDrawer();
              // final customerId =
              //     StorageManager.readData(StorageKeys.customerId);
              // Get.toNamed(AppRoutesNames.cartScreen, arguments: customerId);
            },
          ),
          // Divider(),
          // buildListTile(
          //   text: AppString.mySubscription,
          //   icon: AppIcons.subscriptions,
          //   onTap: () {
          //     Scaffold.of(context).closeDrawer();
          //     Future.delayed(const Duration(milliseconds: 300), () {
          //       Get.to(MainScreen(), arguments: {ArgumentKey.selectedIndex: 3});
          //     });
          //   },
          // ),
          // Divider(),
          // buildListTile(
          //   text: AppString.myOrder,
          //   icon: AppIcons.order,
          //   onTap: () {
          //     Get.to(MainScreen(), arguments: {ArgumentKey.selectedIndex: 2});
          //   },
          // ),
          Divider(),
          buildListTile(
            text: AppString.invoiceHistory,
            icon: AppIcons.invoice,
            onTap: () => Get.back(),
          ),
          Divider(),
          buildListTile(
            text: AppString.billingHistory,
            icon: AppIcons.billingHistory,
            onTap: () => Get.back(),
          ),
          Divider(),
          buildListTile(
            text: AppString.referEarn,
            icon: AppIcons.referEarn,
            onTap: () => Get.back(),
          ),
          Divider(),
          buildListTile(
            text: AppString.help,
            icon: AppIcons.help,
            onTap: () => Get.back(),
          ),
          Divider(),
          120.height,
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Image.asset(
              AppImagesKey.logo,
            ),
          ),
          FutureBuilder<String>(
            future: _versionFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CustomText(text: 'Loading version...'));
              } else if (snapshot.hasError) {
                return const Center(
                    child: CustomText(text: 'Error loading version'));
              } else {
                return Center(
                  child: CustomText(
                    text: '${AppString.version} ${snapshot.data!}',
                    fontSize: AppTextSize.s12,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String text,
    required void Function()? onTap,
  }) {
    return SizedBox(
      height: 40.h,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: AppColors.black),
            10.width,
            CustomText(
              text: text,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 10.w);
  }
}
