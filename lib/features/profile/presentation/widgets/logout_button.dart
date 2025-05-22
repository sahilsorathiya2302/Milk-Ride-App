import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../../../core/storage/storage_manager.dart';
import '../../../../core/ui_component/custom_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 160.w,
      textSize: AppTextSize.s14,
      onPressed: () async {
        await StorageManager.removeData(StorageKeys.mobileNumber);
        await StorageManager.removeData(StorageKeys.tokenKey);
        await StorageManager.removeData(StorageKeys.userId);
        await StorageManager.removeData(StorageKeys.customerId);
        await StorageManager.clearData();

        Get.offAllNamed(AppRoutesNames.signInScreen);
      },
      text: AppString.logout,
    );
  }
}
