import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomSimpleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  final Color? color;
  final IconData? icon;
  final void Function()? onPressed;
  final void Function()? leadingOnPressed;

  final Widget? widget;

  const CustomSimpleAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.color,
    this.widget,
    this.leadingOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: -5,
      leading: IconButton(
        onPressed: leadingOnPressed ??
            () {
              Get.back();
            },
        icon: Icon(
          AppIcons.pageBackArrow,
          size: IconSize.i22,
        ),
      ),
      backgroundColor: color ?? AppColors.white,
      elevation: 0, // Optional: flat style
      automaticallyImplyLeading: false,
      title: CustomText(
        text: title,
        fontSize: AppTextSize.s16,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ).paddingAll(0),
      actions: [
        if (icon != null)
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: AppColors.black,
                ),
              ),

              // BlocBuilder<HomeCubit, HomeState>(
              //   builder: (context, state) {
              //     String qty = "";
              //     if (state is HomeLoaded) {
              //       qty = state.homeResponse.data?.cartQty?.toString() ?? "0";
              //     }
              //     return qty != "0"
              //         ? Container(
              //             height: 20,
              //             width: 20,
              //             decoration: BoxDecoration(
              //               color: AppColors.primaryColor,
              //               shape: BoxShape.circle,
              //             ),
              //             child: Center(
              //               child: CustomText(
              //                 text: qty,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ).paddingSymmetric(horizontal: 5)
              //         : const SizedBox();
              //   },
              // ),

              // cartQty != "0"
              //     ? Container(
              //         height: 20,
              //         width: 20,
              //         decoration: BoxDecoration(
              //             color: AppColors.primaryColor,
              //             shape: BoxShape.circle),
              //         child: Center(
              //             child: CustomText(
              //           text: cartQty ?? "",
              //           fontWeight: FontWeight.w600,
              //         )),
              //       ).paddingSymmetric(horizontal: 5)
              //     : SizedBox()
            ],
          ),
        if (widget != null) widget!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
