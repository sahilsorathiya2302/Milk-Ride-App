import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';

import '../../../../profile/profile_screen.dart';

class SideMenuWidget extends StatefulWidget {
  final VoidCallback onProfileTap;
  const SideMenuWidget({
    super.key,
    required this.onProfileTap,
  });

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          Container(
            height: 90,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  final customer = state.homeResponse.data?.customer;
                  return Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: AppColors.primaryColor,
                        child: CustomText(
                          text: customer?.name?.substring(0, 1) ?? "",
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: AppTextSize.s22,
                        ),
                      ).paddingSymmetric(horizontal: 10.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: customer?.name ?? "",
                            fontWeight: FontWeight.w700,
                            fontSize: AppTextSize.s16,
                          ),
                          Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.r5)),
                            child: Center(
                                child: CustomText(
                              text: customer?.isPostpaid == 0
                                  ? "Prepaid"
                                  : "PostPaid",
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            )),
                          )
                        ],
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ).paddingOnly(
            top: 50.h,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.vacationMode,
                  fontSize: AppTextSize.s16,
                  fontWeight: FontWeight.w700,
                ),
                Switch(
                  activeColor: AppColors.primaryColor,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                )
              ],
            ).paddingSymmetric(horizontal: 10.w),
          ).paddingOnly(
            top: 10.h,
          ),
          ListTile(
            leading: Icon(
              AppIcons.person,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.myProfile,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Get.back(); // Close the drawer
              Future.delayed(Duration(milliseconds: 100), () {
                showProfileBottomSheet(context);
              });
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.preference,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.myPreference,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.cart,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.myCart,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.subscriptions,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.mySubscription,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.order,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.myOrder,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.invoice,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.invoiceHistory,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              AppIcons.help,
              color: AppColors.black,
            ),
            title: CustomText(
              text: AppString.help,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home Screen
            },
          ),

          // Logout Button
        ],
      ),
    );
  }
}
