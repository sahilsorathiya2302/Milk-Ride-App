import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_cubit.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/variants/variants_state.dart';

class VariantQuantitySectorWidget extends StatefulWidget {
  final int minQuantity;
  final int maxQuantity;
  const VariantQuantitySectorWidget(
      {super.key, required this.minQuantity, required this.maxQuantity});

  @override
  State<VariantQuantitySectorWidget> createState() =>
      _VariantQuantitySectorWidgetState();
}

class _VariantQuantitySectorWidgetState
    extends State<VariantQuantitySectorWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantsCubit, VariantsState>(
      builder: (context, state) {
        final cubit = context.read<VariantsCubit>();

        return Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.r22),
            border: Border.all(color: AppColors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconButton(
                icon: AppIcons.remove,
                onPressed: () {
                  context.read<VariantsCubit>().decrementQty();
                },
              ),
              CustomText(
                text: cubit.quantity.toString(),
                fontSize: AppTextSize.s16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              _buildIconButton(
                  icon: AppIcons.add, onPressed: () => cubit.incrementQty()),
            ],
          ),
        );
      },
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
