import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';

import '../../../../../core/constants/app_string.dart';

class ReferralCode extends StatefulWidget {
  const ReferralCode({super.key});

  @override
  State<ReferralCode> createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Center(
            child: CustomText(
              text: AppString.referralCode,
              fontWeight: FontWeight.w700,
              fontSize: AppTextSize.s18,
            ),
          ),
          30.height,
          CustomTitleWithTextField(
            titleText: AppString.titleReferralCode,
            hintText: AppString.hintReferralCode,
          ),
          11.height,
          CustomTitleWithTextField(
            titleText: AppString.titleAgentCode,
            hintText: AppString.agentCode,
          ),
          11.height,
          CustomTitleWithTextField(
            titleText: AppString.titleFind,
            hintText: AppString.findAbout,
          ),
          11.height,
        ],
      ),
    );
  }
}
