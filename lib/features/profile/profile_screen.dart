import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/network_fail_card.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_state.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/user_balance_details.dart';
import 'package:milk_ride_live_wc/features/profile/widgets/user_personal_details.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/icon_size.dart';
import '../../../../../core/ui_component/custom_button.dart';

void showProfileBottomSheet() {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.84,
        maxChildSize: 0.84,
        expand: false,
        builder: (_, controller) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.homeBG,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100.w,
                          height: 7.h,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.r10),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              AppIcons.backArrow,
                              color: AppColors.black,
                            ),
                          ),
                          10.width,
                          CustomText(
                            text: AppString.myProfile,
                            fontSize: AppTextSize.s16,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.height * 0.7185,
                        child: ListView.builder(
                          itemCount: 1,
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) {
                            final customer = state.homeResponse.data?.customer;
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                          AppBorderRadius.r10),
                                    ),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        maxRadius: 35,
                                        backgroundColor: AppColors.black,
                                        child: CustomText(
                                          text:
                                              customer?.name?.substring(0, 1) ??
                                                  "",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: AppTextSize.s28,
                                        ),
                                      ),
                                      title: CustomText(
                                        text: customer?.name.toString() ??
                                            AppString.empty,
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppTextSize.s16,
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Icon(
                                            AppIcons.verified,
                                            size: IconSize.i18,
                                            color: AppColors.primaryColor,
                                          ),
                                          2.width,
                                          CustomText(
                                            text: AppString.verified,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  10.height,
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                          AppBorderRadius.r10),
                                    ),
                                    child: ListTile(
                                      leading:
                                          Icon(Icons.child_friendly_outlined),
                                      title: CustomText(
                                        text: AppString.vacationMode,
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppTextSize.s16,
                                      ),
                                      trailing: Switch(
                                        activeColor: AppColors.primaryColor,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  10.height,
                                  CustomText(
                                    text: AppString.referralCode,
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppTextSize.s14,
                                  ),
                                  10.height,
                                  Row(
                                    children: [
                                      Container(
                                        width: 270.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                              AppBorderRadius.r10),
                                        ),
                                        child: Row(
                                          children: [
                                            CustomText(
                                              text: customer
                                                      ?.customerReferrerCode
                                                      .toString() ??
                                                  AppString.empty,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.grey,
                                              fontSize: AppTextSize.s12,
                                            ).paddingSymmetric(horizontal: 10),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              AppBorderRadius.r10),
                                        ),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              AppIcons.copy,
                                              color: AppColors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                  10.height,
                                  CustomText(
                                    text: AppString.address,
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppTextSize.s14,
                                  ),
                                  10.height,
                                  UserPersonalDetails(
                                    title: AppString.profileEmail,
                                    info: (customer?.email == null ||
                                            customer?.email.toString() ==
                                                AppString.email)
                                        ? AppString.notFound
                                        : customer?.email.toString() ??
                                            AppString.empty,
                                  ),
                                  10.height,
                                  UserPersonalDetails(
                                    title: AppString.profileMobileNumber,
                                    info: customer?.mobileNumber.toString() ??
                                        AppString.empty,
                                  ),
                                  10.height,
                                  UserPersonalDetails(
                                    title: AppString.profileGender,
                                    info: customer?.gender.toString() ??
                                        AppString.empty,
                                  ),
                                  20.height,
                                  UserBalanceDetails(
                                      icon: AppIcons.wallet,
                                      title: AppString.walletBalance,
                                      info:
                                          "${AppString.rupeeSymbol} ${customer?.wallet}"),
                                  10.height,
                                  UserBalanceDetails(
                                      icon: AppIcons.credit,
                                      title: AppString.creditLimit,
                                      info:
                                          "${AppString.rupeeSymbol} ${customer?.creditLimit}"),
                                  10.height,
                                  CustomButton(
                                      onPressed: () async {
                                        // await StorageManager.clearData();

                                        await StorageManager.removeData(
                                            StorageKeys.mobileNumber);
                                        await StorageManager.removeData(
                                            StorageKeys.tokenKey);
                                        await StorageManager.removeData(
                                            StorageKeys.userId);

                                        await StorageManager.clearData();
                                        Get.offAllNamed(
                                            AppRoutesNames.signInScreen);
                                      },
                                      text: AppString.logout)
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is HomeError) {
                return NetworkFailCard(message: state.failure);
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      );
    },
  );
}
