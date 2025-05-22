import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_list.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/add_balance/add_balance_state.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_cubit.dart';

import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_border_radius.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../../core/theme/app_text_size.dart';
import '../../../../../core/theme/icon_size.dart';
import '../../../../../core/ui_component/custom_text.dart';
import '../../../../../core/ui_component/custom_text_field.dart';

class EnterAmountWidget extends StatefulWidget {
  const EnterAmountWidget({super.key});

  @override
  State<EnterAmountWidget> createState() => _EnterAmountWidgetState();
}

class _EnterAmountWidgetState extends State<EnterAmountWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WalletCubit>();
    return Form(
      key: _formKey,
      child: Container(
          height: 160.h,
          decoration: BoxDecoration(
            color: AppColors.lightGrey1,
            borderRadius: BorderRadius.circular(AppBorderRadius.r10),
          ),
          child: BlocBuilder<AddBalanceCubit, AddBalanceState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    height: 110.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45.h,
                          width: 350.w,
                          child: CustomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an amount';
                              }
                              final amount = double.tryParse(value);
                              if (amount == null ||
                                  amount < 1 ||
                                  amount > 10000) {
                                return 'Amount must be between ${cubit.walletData?.customerData?.minimumCashCollection} and ${cubit.walletData?.customerData?.maximumCashCollection}';
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              context
                                  .read<AddBalanceCubit>()
                                  .amount(priceController.text);
                              _formKey.currentState?.validate();
                            },
                            filled: true,
                            borderColor: AppColors.transparent,
                            fillColor: AppColors.lightGrey,
                            borderRadius: AppBorderRadius.r10,
                            keyboardType: TextInputType.number,
                            controller: priceController,
                            hintText: AppString.addAmount,
                            preFixIcon: Icon(
                              AppIcons.currencyRupee,
                              size: IconSize.i18,
                            ),
                          ),
                        ),
                        10.height,
                        SizedBox(
                          height: 30.h,
                          child: ListView.builder(
                            itemCount: AppList.selectPrice.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<AddBalanceCubit>().amount(
                                      priceController.text =
                                          AppList.selectPrice[index]);
                                  _formKey.currentState?.validate();
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                        AppBorderRadius.r5),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      fontWeight: FontWeight.w600,
                                      text:
                                          "${AppString.rupeeSymbol} ${AppList.selectPrice[index]}",
                                    ),
                                  ),
                                ).paddingOnly(right: 10.w),
                              );
                            },
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  ),
                  10.height,
                  CustomText(
                    maxLine: 2,
                    fontSize: AppTextSize.s11,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    text:
                        "${state.selectedMethod == AppString.online ? AppString.payment : AppString.paymentRequest} ${AppString.minimumValue}${cubit.walletData?.customerData?.minimumCashCollection} ${AppString.maximumValue}${cubit.walletData?.customerData?.maximumRecharge}.${AppString.rangeAmount}",
                  ).paddingSymmetric(horizontal: 10),
                ],
              );
            },
          )).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
    );
  }
}
