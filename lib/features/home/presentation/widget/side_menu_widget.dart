import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/profile/profile_screen.dart';
import 'package:milk_ride_live_wc/services/injection.dart';

class SideMenuWidget extends StatefulWidget {
  final VoidCallback onProfileTap;
  final int customerId;

  const SideMenuWidget({
    super.key,
    required this.onProfileTap,
    required this.customerId,
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
          Container(
            height: 90.w,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  final customer = state.homeResponse.data?.customer;
                  if (customer == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: AppColors.primaryColor,
                        child: CustomText(
                          text: customer.name?.substring(0, 1) ?? "",
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
                            text: customer.name ?? "",
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
                              text: customer.isPostpaid == 0
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
                } else if (state is HomeError) {
                  return Center(
                      child: CustomText(
                    text: state.failure,
                    fontWeight: FontWeight.w600,
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
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
          buildListTile(
            text: AppString.myProfile,
            icon: AppIcons.person,
            onTap: () {
              Get.back();
              Future.delayed(Duration(milliseconds: 100), () {
                showProfileBottomSheet();
              });
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.myPreference,
            icon: AppIcons.preference,
            onTap: () {
              Get.back();
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.myCart,
            icon: AppIcons.cart,
            onTap: () {
              final customerId = getIt<HomeCubit>().customerData?.id;
              Get.toNamed(AppRoutesNames.cartScreen, arguments: customerId);
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.mySubscription,
            icon: AppIcons.subscriptions,
            onTap: () {
              Get.back();
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.myOrder,
            icon: AppIcons.order,
            onTap: () {
              Get.toNamed(AppRoutesNames.orderScreen);
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.invoiceHistory,
            icon: AppIcons.invoice,
            onTap: () {
              Get.back();
            },
          ),
          Divider(),
          buildListTile(
            text: AppString.help,
            icon: AppIcons.help,
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      {required IconData icon,
      required String text,
      required void Function()? onTap}) {
    return SizedBox(
      height: 40,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.black,
            ),
            CustomText(
              text: text,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
