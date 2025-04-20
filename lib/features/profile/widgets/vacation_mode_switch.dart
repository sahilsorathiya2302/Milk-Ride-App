import 'package:flutter/material.dart';

import '../../../core/constants/app_string.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_size.dart';
import '../../../core/ui_component/custom_text.dart';

class VacationModeSwitch extends StatelessWidget {
  const VacationModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      child: ListTile(
        leading: const Icon(Icons.child_friendly_outlined),
        title: CustomText(
          text: AppString.vacationMode,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ),
        trailing: Switch(
          activeColor: AppColors.primaryColor,
          value: true, // Replace with dynamic value
          onChanged: (value) {}, // Connect to logic
        ),
      ),
    );
  }
}
