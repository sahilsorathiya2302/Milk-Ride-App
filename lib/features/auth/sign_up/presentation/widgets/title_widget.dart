import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui_component/custom_title.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTitle(
      text: AppString.signUp,
      color: AppColors.primaryColor,
    );
  }
}
