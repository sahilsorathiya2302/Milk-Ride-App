import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomQuantitySector extends StatefulWidget {
  final int? minQuantity;
  final int? maxQuantity;
  final void Function()? removeOnPressed;
  final void Function()? addOnPressed;
  final String? quantity;

  const CustomQuantitySector(
      {super.key,
      this.minQuantity,
      this.maxQuantity,
      this.removeOnPressed,
      this.addOnPressed,
      this.quantity});

  @override
  State<CustomQuantitySector> createState() => _CustomQuantitySectorState();
}

class _CustomQuantitySectorState extends State<CustomQuantitySector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.r22),
        border: Border.all(color: AppColors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            icon: AppIcons.remove,
            onPressed: widget.removeOnPressed,
          ),
          CustomText(
            text: widget.quantity ?? "1",
            fontSize: AppTextSize.s16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          _buildIconButton(
            icon: AppIcons.add,
            onPressed: widget.addOnPressed,
          )
        ],
      ),
    );
  }

  Widget _buildIconButton({required IconData icon, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30.w,
        height: 30.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: onPressed == null ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}
