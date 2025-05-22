import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_network_images.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/order_cancel_dialog.dart';

class CustomOrderInfo extends StatelessWidget {
  final dynamic cubit;

  const CustomOrderInfo({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit.length,
      itemBuilder: (context, index) {
        final orderData = cubit[index];
        return Container(
          height: 90.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppBorderRadius.r10,
            ),
          ),
          child: Row(
            children: [
              10.width,
              ClipRRect(
                borderRadius: BorderRadius.circular(AppBorderRadius.r5),
                child: CustomNetworkImages(
                  src: orderData?.imageUrl ?? AppString.empty,
                  height: 70.h,
                  width: 70.w,
                ),
              ),
              10.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        orderData?.subscriptionType != null
                            ? recommended(title: AppString.subscription)
                            : SizedBox(),
                        orderData?.subscriptionType == null
                            ? recommended(
                                title: orderData?.subscriptionType == null
                                    ? AppString.buy
                                    : orderData!.subscriptionType.toString())
                            : SizedBox(),
                        5.width,
                        recommended(
                            title: orderData?.deliveryType ?? AppString.empty),
                        5.width,
                        orderData?.packageStatus == AppString.delivered
                            ? recommended(
                                title: orderData?.packageStatus.to ??
                                    AppString.empty,
                                color: AppColors.green,
                                textColor: AppColors.white)
                            : SizedBox(),
                        5.width,
                        orderData.refundStatus != null
                            ? recommended(
                                title:
                                    orderData?.refundStatus ?? AppString.empty,
                                color: AppColors.green,
                                textColor: AppColors.white)
                            : SizedBox(),
                        Spacer(),
                        orderData.refundStatus == null &&
                                orderData.packageStatus !=
                                    AppString.delivered &&
                                orderData.subscriptionType == null
                            ? SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => OrderCancelDialog(
                                          packageId: orderData?.packageId ?? 0,
                                          orderId: orderData?.orderId ?? 0,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      AppIcons.delete,
                                      size: IconSize.i18,
                                      color: AppColors.red,
                                    )),
                              )
                            : SizedBox(),
                      ],
                    ),
                    5.height,
                    RichText(
                      text: TextSpan(
                          text: "${orderData?.name} ● ",
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: AppString.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: AppTextSize.s13),
                          children: [
                            TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.darkGrey),
                                text:
                                    "${orderData?.packageSize}${orderData?.volume}")
                          ]),
                    ),
                    5.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              "${AppString.rupeeSymbol}${double.parse(orderData?.salePrice).toStringAsFixed(0)} X ${orderData?.qty}",
                          color: AppColors.darkGrey,
                        ),
                        CustomText(
                          text:
                              "${AppString.rupeeSymbol}${double.parse(orderData?.totalSalePrice).toStringAsFixed(0)}",
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.width,
            ],
          ),
        ).paddingSymmetric(vertical: 10.h);
      },
    );
  }
}

Container recommended({
  required String title,
  Color? color,
  Color? textColor,
}) {
  return Container(
    height: 18.h,
    decoration: BoxDecoration(
      color: color ?? AppColors.lightGrey,
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
    ),
    child: Center(
      child: CustomText(
        text: title.isNotEmpty
            ? '${title[0].toUpperCase()}${title.substring(1)}'
            : '',
        fontSize: AppTextSize.s10,
        color: textColor ?? AppColors.black,
      ).paddingSymmetric(horizontal: 10.w),
    ),
  );
}
