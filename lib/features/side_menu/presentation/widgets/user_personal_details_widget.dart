import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_string.dart';
import '../../../../core/theme/app_border_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_size.dart';
import '../../../../core/ui_component/custom_text.dart';
import '../../../auth/domain/entities/customer.dart';

class UserPersonalDetailsWidget extends StatelessWidget {
  final Customer customer;
  const UserPersonalDetailsWidget({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.w,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundColor: AppColors.primaryColor,
            child: Center(
              child: CustomText(
                text: customer.name?.substring(0, 1) ?? "",
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s20,
              ),
            ),
          ).paddingSymmetric(horizontal: 10.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: customer.name ?? AppString.empty,
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s16,
              ),
              Container(
                height: 20.h,
                width: 65.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
                child: Center(
                    child: CustomText(
                  text: customer.isPostpaid == 0
                      ? AppString.prePaid
                      : AppString.postPaid,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                )),
              )
            ],
          ),
        ],
      ),
    ).paddingOnly(top: 50);
  }
}
