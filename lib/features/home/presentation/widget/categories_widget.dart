import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/cetegories.dart';

import '../../../../../core/ui_component/custom_view_button.dart';
import 'main_title_widget.dart';

class CategoriesWidget extends StatefulWidget {
  final int customerId;
  final List<Categories>? state;
  final String configImage;
  const CategoriesWidget(
      {super.key,
      required this.customerId,
      this.state,
      required this.configImage});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(
          title: AppString.categories,
          onPressed: () {
            Get.toNamed(AppRoutesNames.viewCategories, arguments: {
              ArgumentKey.customerId: widget.customerId,
              ArgumentKey.configImage: widget.configImage
            });
          },
        ),
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            itemCount: widget.state?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final categories = widget.state![index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutesNames.categoryProduct, arguments: {
                    ArgumentKey.categoryId: categories.id,
                    ArgumentKey.customerId: widget.customerId,
                    ArgumentKey.appBarTitle: categories.name,
                    ArgumentKey.configImage: widget.configImage,
                  });
                },
                child: Container(
                    width: 110.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r10)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppBorderRadius.r10),
                            topLeft: Radius.circular(AppBorderRadius.r10),
                          ),
                          child: CustomNetworkImages(
                            src: categories.imageUrl ?? widget.configImage,
                            height: 105.h,
                            width: 110.w,
                          ),
                        ),
                        CustomViewButton(
                          text: categories.name.toString(),
                        ),
                      ],
                    )).paddingOnly(left: index == 0 ? 10.w : 0.w, right: 10.w),
              );
            },
          ),
        ),
      ],
    );
  }
}
