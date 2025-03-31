import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/features/auth/presentations/otp/widgets/submit_otp_button_widget.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatefulWidget {
  const PinPutWidget({super.key});

  @override
  State<PinPutWidget> createState() => _PinPutWidgetState();
}

class _PinPutWidgetState extends State<PinPutWidget> {
  final TextEditingController otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontFamily: AppString.fontFamily,
        fontSize: AppTextSize.s20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.black),
      ),
    );
    return Column(
      children: [
        Pinput(
          controller: otpController,
          defaultPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (value) => AppValidation.emptyValue(value),
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
        ),
        50.height,
        SubmitOtpButtonWidget(
          otpController: otpController,
          getArgument: Get.arguments,
        ),
      ],
    );
  }
}
