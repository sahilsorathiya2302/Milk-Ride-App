import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/features/auth/cubit/auth_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/cubit/auth_state.dart';

import '../../../../../core/constants/app_string.dart';

class MobileNumberFormWidgets extends StatefulWidget {
  const MobileNumberFormWidgets({super.key});

  @override
  State<MobileNumberFormWidgets> createState() =>
      _MobileNumberFormWidgetsState();
}

class _MobileNumberFormWidgetsState extends State<MobileNumberFormWidgets> {
  final TextEditingController mobileNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  validator: (p0) {
                    return AppValidation.validatePhoneNumber(p0);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: mobileNumber,
                  hintText: AppString.hintMobile),
              20.height,
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<AuthCubit>().postSignInData(
                        context: context,
                        mobileNumber: mobileNumber.text,
                        userId: AppString.everMilk);
                  }
                },
                text: AppString.continues,
              ),
            ],
          ),
        );
      },
    );
  }
}
