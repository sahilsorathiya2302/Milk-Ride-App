import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_cubit.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/modify_temporarily/modify_temporarily_state.dart';

class PickTypeWidget extends StatelessWidget {
  const PickTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyTemporarilyCubit, ModifyTemporarilyState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.pickType,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s14,
            ),
            5.height,
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.r10),
              ),
              child: Row(
                children: [
                  10.width,
                  buildPickType(
                    pickType: state.pickType,
                    type: AppString.singleDay,
                    onPressed: () {
                      context
                          .read<ModifyTemporarilyCubit>()
                          .updatePickType(AppString.singleDay);
                    },
                  ),
                  10.width,
                  buildPickType(
                    pickType: state.pickType,
                    type: AppString.multipleDay,
                    onPressed: () {
                      context
                          .read<ModifyTemporarilyCubit>()
                          .updatePickType(AppString.multipleDay);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  SizedBox buildPickType(
      {required void Function()? onPressed,
      required String pickType,
      required String type}) {
    return SizedBox(
      height: 35.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor:
              pickType == type ? AppColors.primaryColor : AppColors.white,
          side: BorderSide(
            color: pickType == type ? AppColors.primaryColor : AppColors.grey,
          ),
        ),
        child: CustomText(
            text: type,
            fontWeight: FontWeight.w600,
            color: pickType == type ? AppColors.white : AppColors.grey),
      ),
    );
  }
}
