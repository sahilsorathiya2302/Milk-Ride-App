import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/key/app_images_key.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/utils/list_utils.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

import '../../../product/presentation/variants/variants_screen.dart';

class CardWidget extends StatefulWidget {
  final List<ProductData> state;
  final int customerId;
  const CardWidget({super.key, required this.state, required this.customerId});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List<dynamic> uniqueProducts = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueProducts = ListUtils.getUniqueProductsByProductId(widget.state);
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        itemCount: uniqueProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final newArrival = uniqueProducts[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutesNames.productDetails, arguments: {
                ArgumentKey.customerId: widget.customerId,
                ArgumentKey.productId: newArrival.productId,
                ArgumentKey.packageId: newArrival.id,
              });
            },
            child: Card(
                child: Container(
              width: 140.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppBorderRadius.r12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r12),
                        child: CustomNetworkImages(
                          src: newArrival.imageUrl.toString(),
                          height: 110.h,
                          width: 220.w,
                        ),
                      ),
                      newArrival.mustTry == true
                          ? Container(
                              height: 20.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(AppBorderRadius.r12),
                                  bottomLeft:
                                      Radius.circular(AppBorderRadius.r12),
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: AppString.mustTry,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontSize: AppTextSize.s10,
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: newArrival.brand.toString().isNotEmpty
                                ? newArrival.brand.toString()
                                : "No Brand",
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey,
                          ),
                          Spacer(),
                          if (newArrival.foodType == AppString.foodTypeVeg)
                            Image.asset(
                              AppImagesKey.foodType,
                              height: 10.h,
                            )
                          else if (newArrival.foodType ==
                              AppString.foodTypeVegan)
                            Image.asset(
                              AppImagesKey.vegan,
                              height: 19.h,
                            )
                        ],
                      ),
                      3.height,
                      CustomText(
                        maxLine: 1,
                        text: newArrival.name.toString(),
                        fontWeight: FontWeight.w700,
                      ),
                      3.height,
                      Row(
                        children: [
                          CustomText(
                            text: newArrival.packageSize.toString(),
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey,
                          ),
                          2.width,
                          CustomText(
                            text: newArrival.volume.toString(),
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                      3.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text:
                                    "${AppString.rupeeSymbol}${double.parse(newArrival.salePrice).toStringAsFixed(0)}",
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                              5.width,
                              CustomText(
                                textDecoration: TextDecoration.lineThrough,
                                text:
                                    "${AppString.rupeeSymbol}${double.parse(newArrival.mrpPrice).toStringAsFixed(0)}",
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              variantSheet(
                                context: context,
                                productId: newArrival.productId ?? 0,
                                packageId: newArrival.id ?? 0,
                              );
                            },
                            child: Container(
                              height: 18.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    AppBorderRadius.r5,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    AppIcons.add,
                                    size: 15,
                                    color: AppColors.black,
                                  ),
                                  CustomText(
                                    text: AppString.add,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppTextSize.s11,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 5.w, vertical: 5.h)
                ],
              ),
            )),
          );
        },
      ).paddingOnly(left: 10.w, right: 10.w),
    );
  }
}
