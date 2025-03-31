import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_state.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../../../../core/theme/app_colors.dart';

class ResendOtpWidget extends StatefulWidget {
  final dynamic getArgument;
  const ResendOtpWidget({
    super.key,
    required this.getArgument,
  });

  @override
  State<ResendOtpWidget> createState() => _ResendOtpWidgetState();
}

class _ResendOtpWidgetState extends State<ResendOtpWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: AppString.notReceiveCode,
          fontSize: AppTextSize.s16,
          fontWeight: FontWeight.w700,
        ),
        10.height,
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return OtpTimerButton(
              // controller: controller,
              buttonType: ButtonType.elevated_button,
              radius: AppBorderRadius.r10,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                context.read<AuthCubit>().resendOtp(
                    mobileNumber: widget.getArgument[ArgumentKey.mobileNumber],
                    userId: widget.getArgument[ArgumentKey.userId],
                    context: context);
              },
              text: Text(
                AppString.resendOtp,
                style: TextStyle(
                    fontFamily: AppString.fontFamily,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
              ),

              duration: 10,
            );
          },
          // listener: (context, state) {
          //   if (state is ResendOtpSuccessState) {
          //     FunctionalComponent.successSnackbar(
          //         state.resendOtpResponse.message.toString(),
          //         state.resendOtpResponse.data.toString());
          //   }
          // },
        )
      ],
    );
  }
}
