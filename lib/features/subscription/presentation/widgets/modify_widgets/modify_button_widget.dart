import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/widgets/subscription_custom_button.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/routes/app_routes_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_button.dart';
import '../../../../../core/ui_component/custom_dialog_box.dart';
import '../../../domain/entities/subscription_data.dart';

class ModifyButtonWidget extends StatefulWidget {
  final SubscriptionData state;
  const ModifyButtonWidget({super.key, required this.state});

  @override
  State<ModifyButtonWidget> createState() => _ModifyButtonWidgetState();
}

class _ModifyButtonWidgetState extends State<ModifyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.state.pauseSubscription == null
        ? SubscriptionCustomButton(
            title: AppString.modify,
            icon: AppIcons.calendar,
            onTap: () {
              showConfirmationDialog(
                icon: AppIcons.calendar,
                title: AppString.subModify,
                subTitle: AppString.subModifyMessage,
                widget: Column(
                  children: [
                    CustomButton(
                        height: 30.h,
                        onPressed: () {
                          Get.back();
                          Get.toNamed(AppRoutesNames.modifyTemporarilyWidget,
                              arguments: widget.state);
                        },
                        textSize: AppTextSize.s12,
                        text: AppString.modifyTemporarily),
                    CustomButton(
                        height: 30.h,
                        onPressed: () {
                          Get.back();
                          Get.toNamed(AppRoutesNames.updatePermanentlyWidget,
                              arguments: widget.state);
                        },
                        color: AppColors.white,
                        border: true,
                        textColor: AppColors.primaryColor,
                        textSize: AppTextSize.s12,
                        text: AppString.updatePermanently),
                  ],
                ),
              );
            },
          )
        : SizedBox();
  }
}
