import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/storage/storage_keys.dart';
import '../../../../../core/storage/storage_manager.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/ui_component/custom_text.dart';
import '../../../../../core/utils/functional_component.dart';
import '../../cubit/add_balance/add_balance_state.dart';

class CashRequestButton extends StatelessWidget {
  const CashRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddBalanceCubit>();
    final customerId = StorageManager.readData(StorageKeys.customerId);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocBuilder<AddBalanceCubit, AddBalanceState>(
          builder: (context, state) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLightColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r10)),
                    fixedSize: Size(
                      340.w,
                      60.h,
                    )),
                onPressed: () {
                  final parsedDate =
                      DateFormat("dd/MM/yyyy").parse(state.selectDate);
                  final formattedDate =
                      DateFormat("yyyy-MM-dd").format(parsedDate);

                  if (cubit.state.amount == AppString.zero) {
                    FunctionalComponent.errorMessageSnackbar(
                        message: AppString.enterAmount);
                  } else if (cubit.state.amount != AppString.zero) {
                    Get.back();
                    context.read<AddBalanceCubit>().payCash(
                          customerId: customerId,
                          amount: state.amount,
                          date: formattedDate,
                        );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppString.totalAmount,
                          color: AppColors.darkGrey,
                          fontSize: AppTextSize.s14,
                          fontWeight: FontWeight.w700,
                        ),
                        10.width,
                        CustomText(
                          text: "${AppString.rupeeSymbol}${cubit.state.amount}",
                          fontSize: AppTextSize.s14,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: AppString.processToRequest,
                          fontSize: AppTextSize.s14,
                          fontWeight: FontWeight.w700,
                        ),
                        5.width,
                        Icon(AppIcons.forwardArrow)
                      ],
                    ),
                  ],
                ));
          },
        ),
        Container(
          height: 8.h,
          color: AppColors.homeBG,
        )
      ],
    );
  }
}
