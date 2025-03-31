import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/cetegories.dart';

class CategoriesWidget extends StatefulWidget {
  final List<Categories>? state;
  const CategoriesWidget({super.key, required this.state});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.categories,
          fontWeight: FontWeight.w700,
          fontSize: AppTextSize.s16,
        ).paddingSymmetric(horizontal: 15.w),
        10.height,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            itemCount: widget.state?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final categories = widget.state?[index];
              return Container(
                margin: EdgeInsets.only(left: 15.w),
                width: 120,
                decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r10)),
                child: Column(
                  children: [
                    5.height,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                      child: Image.network(
                        categories?.imageUrl ??
                            "https://via.placeholder.com/80",
                        height: 80,
                        width: 80,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 25.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                      ),
                      child: Center(
                        child: CustomText(
                          text: AppString.view,
                          fontWeight: FontWeight.w700,
                          fontSize: AppTextSize.s14,
                        ),
                      ),
                    ),
                    10.height,
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
