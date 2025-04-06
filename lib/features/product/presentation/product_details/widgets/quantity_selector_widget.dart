import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

import '../../../../../core/controller/quantity_controller.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';

class QuantitySelectorWidget extends StatefulWidget {
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int>? onQuantityChanged;
  final int initialQuantity;

  const QuantitySelectorWidget({
    super.key,
    required this.minQuantity,
    required this.maxQuantity,
    this.onQuantityChanged,
    this.initialQuantity = 1,
  });

  @override
  State<QuantitySelectorWidget> createState() => _QuantitySelectorWidgetState();
}

class _QuantitySelectorWidgetState extends State<QuantitySelectorWidget> {
  late final ProductQuantityController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(ProductQuantityController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setQuantity(widget.initialQuantity);
      widget.onQuantityChanged?.call(controller.quantity.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 40.h,
          width: 110.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.r22),
            border: Border.all(color: AppColors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                icon: AppIcons.remove,
                onPressed: controller.quantity.value > widget.minQuantity
                    ? () {
                        controller.decrement(widget.minQuantity);
                        widget.onQuantityChanged
                            ?.call(controller.quantity.value);
                      }
                    : null,
              ),
              CustomText(
                text: "${controller.quantity.value}",
                fontSize: AppTextSize.s16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              _buildIconButton(
                icon: AppIcons.add,
                onPressed: controller.quantity.value < widget.maxQuantity
                    ? () {
                        controller.increment(widget.maxQuantity);
                        widget.onQuantityChanged
                            ?.call(controller.quantity.value);
                      }
                    : null,
              ),
            ],
          ),
        ));
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
        child:
            Icon(icon, color: onPressed == null ? Colors.grey : Colors.black),
      ),
    );
  }
}
