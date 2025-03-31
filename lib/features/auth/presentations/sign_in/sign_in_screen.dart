import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/widgets/info_widgets.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/widgets/mobile_number_form_widgets.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/sign_in/widgets/title_widget.dart';

import '../../../../core/ui_component/custom_logo_image.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLogoImage(),
          TitleWidget(),
          5.height,
          InfoWidgets(),
          15.height,
          MobileNumberFormWidgets(),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
