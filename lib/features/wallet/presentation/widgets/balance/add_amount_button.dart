import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_state.dart';

class AddAmountButton extends StatelessWidget {
  const AddAmountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddBalanceCubit>();
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final mobileNumber = StorageManager.readData(StorageKeys.mobileNumber);
    final name = context.read<HomeCubit>().customerData?.name;

    return BlocBuilder<AddBalanceCubit, AddBalanceState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
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
                  if (cubit.state.amount == AppString.zero) {
                    FunctionalComponent.errorMessageSnackbar(
                        message: AppString.enterAmount);
                  } else if (cubit.state.amount != AppString.zero) {
                    Get.back();
                    context.read<AddBalanceCubit>().payOnline(
                        amount: cubit.state.amount,
                        mobileNumber: mobileNumber,
                        customerId: customerId,
                        name: name ?? "");
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
                          text: AppString.processToPay,
                          fontSize: AppTextSize.s14,
                          fontWeight: FontWeight.w700,
                        ),
                        5.width,
                        Icon(AppIcons.forwardArrow)
                      ],
                    ),
                  ],
                )),
            Container(
              height: 8.h,
              color: AppColors.homeBG,
            )
          ],
        );
      },
    );
  }
}
