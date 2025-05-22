import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/side_menu/presentation/cubit/vacation/vacation_cubit.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/ui_component/custom_text.dart';

class VacationMessageWidget extends StatefulWidget {
  const VacationMessageWidget({super.key});

  @override
  State<VacationMessageWidget> createState() => _VacationMessageWidgetState();
}

class _VacationMessageWidgetState extends State<VacationMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            AppImagesKey.notificationImage,
            width: 20,
            height: 20,
          ),
          CustomText(
            text: AppString.vacationModeNotification,
            fontWeight: FontWeight.w600,
          ),
          IconButton(
              onPressed: () {
                showConfirmationDialog(
                  title: AppString.areYouSure,
                  subTitle: AppString.vacationModeOff,
                  onPressed: () async {
                    Get.back();
                    context.read<VacationCubit>().vacationToggle(false);

                    final deviceInfo = DeviceInfoPlugin();
                    final packageInfo = await PackageInfo.fromPlatform();
                    final androidInfo = await deviceInfo.androidInfo;
                    Get.context?.read<HomeCubit>().getHomeData(HomeParam(
                          mobileNumber:
                              StorageManager.readData(StorageKeys.mobileNumber),
                          userId: StorageManager.readData(StorageKeys.userId),
                          type: "app",
                          deviceType: "Android",
                          devicesModel: androidInfo.model,
                          devicesId: androidInfo.id,
                          version: packageInfo.version,
                        ));
                  },
                );
              },
              icon: Icon(AppIcons.editIcon)),
        ],
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
