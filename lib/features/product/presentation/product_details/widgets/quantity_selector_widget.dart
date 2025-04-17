import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/product_details/product_details_cubit.dart';

import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';

class QuantitySelectorWidget extends StatefulWidget {
  final int minQuantity;
  final int maxQuantity;

  const QuantitySelectorWidget({
    super.key,
    required this.minQuantity,
    required this.maxQuantity,
  });

  @override
  State<QuantitySelectorWidget> createState() => _QuantitySelectorWidgetState();
}

class _QuantitySelectorWidgetState extends State<QuantitySelectorWidget> {
  final cubit = Get.context?.read<ProductDetailsCubit>();

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
            onPressed: () {
              context.read<ProductDetailsCubit>().decrementQty();
            },
          ),
          CustomText(
            text: cubit?.quantity.toString() ?? "",
            fontSize: AppTextSize.s16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          _buildIconButton(
              icon: AppIcons.add, onPressed: () => cubit?.incrementQty()),
        ],
      ),
    );
  }
}

Widget _buildIconButton({required IconData icon, VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 40.w,
      height: 40.h,
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
