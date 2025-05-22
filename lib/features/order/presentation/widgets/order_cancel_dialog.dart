import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_cubit.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order_cancel/order_cancel_state.dart';
import 'package:milk_ride_live_wc/features/order/presentation/widgets/reason_sheet_widget.dart';

class OrderCancelDialog extends StatefulWidget {
  final int orderId;
  final int packageId;

  const OrderCancelDialog({
    super.key,
    required this.orderId,
    required this.packageId,
  });

  @override
  State<OrderCancelDialog> createState() => _OrderCancelDialogState();
}

class _OrderCancelDialogState extends State<OrderCancelDialog> {
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();

    if (reasonController.text.isEmpty && cubit.state.cancelReason.isNotEmpty) {
      reasonController.text = cubit.state.cancelReason;
    }

    return AlertDialog(
      backgroundColor: AppColors.homeBG,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r12),
      ),
      title: CustomText(
        text: AppString.requiredSelectReason,
        fontWeight: FontWeight.w700,
        fontSize: AppTextSize.s14,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: reasonController,
            onTap: () async {
              final selectedReason = await showModalBottomSheet<String>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppBorderRadius.r18),
                  ),
                ),
                builder: (context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppBorderRadius.r18),
                    ),
                    child: const ReasonSheetWidget(),
                  );
                },
              );

              if (selectedReason != null) {
                reasonController.text = selectedReason;
                cubit.selectReason(selectedReason, cubit.state.reasonId ?? 0);
              }
            },
            readOnly: true,
            style: TextStyle(
              fontFamily: AppString.fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: AppTextSize.s12,
              color: AppColors.grey,
            ),
            decoration: InputDecoration(
              hintText: AppString.selectReason,
              suffixIcon: Icon(AppIcons.arrowDropDown),
              hintStyle: TextStyle(
                fontSize: AppTextSize.s14,
                color: AppColors.grey,
              ),
              enabledBorder: _buildOutlineInputBorder(AppColors.black),
              focusedBorder: _buildOutlineInputBorder(AppColors.black),
              errorBorder: _buildOutlineInputBorder(AppColors.red),
              focusedErrorBorder: _buildOutlineInputBorder(AppColors.red),
              border: _buildOutlineInputBorder(AppColors.black),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  reasonController.clear();
                  cubit.selectReason("", 0);
                  Get.back();
                },
                text: AppString.cancel,
                height: 30,
                textSize: AppTextSize.s13,
                color: AppColors.red,
              ),
            ),
            10.width,
            Expanded(child: BlocBuilder<OrderCancelCubit, OrderCancelState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    if (reasonController.text.isEmpty) {
                      FunctionalComponent.errorMessageSnackbar(
                          message: AppString.emptySelectReasonMsg);
                    } else {
                      print(widget.orderId);
                      print(widget.packageId);
                      print(cubit.state.reasonId);

                      context.read<OrderCancelCubit>().orderCancel(
                          orderId: widget.orderId,
                          packageId: widget.packageId,
                          reasonId: cubit.state.reasonId ?? 0);
                      Get.back();
                    }
                  },
                  text: AppString.delete,
                  height: 30,
                  textSize: AppTextSize.s13,
                );
              },
            )),
          ],
        ),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      borderSide: BorderSide(color: color),
    );
  }
}
