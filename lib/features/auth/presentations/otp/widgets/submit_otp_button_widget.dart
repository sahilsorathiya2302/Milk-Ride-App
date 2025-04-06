import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/argument_key.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/cubit/auth/auth_state.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/widgets/resend_otp_widget.dart';

class SubmitOtpButtonWidget extends StatefulWidget {
  final dynamic getArgument;
  final TextEditingController otpController;

  const SubmitOtpButtonWidget({
    super.key,
    required this.otpController,
    this.getArgument,
  });

  @override
  State<SubmitOtpButtonWidget> createState() => _SubmitOtpButtonWidgetState();
}

class _SubmitOtpButtonWidgetState extends State<SubmitOtpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // final argument = Get.arguments ?? {};
    //
    // final String mobileNumber = argument["mobile_number"]?.toString() ?? "";
    // final int userId = (argument["userId"] ?? 0) as int;

    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CustomButton(
              onPressed: () {
                context.loaderOverlay.show();
                context.read<AuthCubit>().otpCheck(
                      mobileNumber:
                          widget.getArgument[ArgumentKey.mobileNumber],
                      userId: widget.getArgument[ArgumentKey.userId],
                      otp: widget.otpController.text,
                    );
              },
              text: AppString.submit,
            );
          },
        ),
        30.height,
        ResendOtpWidget(
          getArgument: Get.arguments,
        ),
      ],
    );
  }
}
