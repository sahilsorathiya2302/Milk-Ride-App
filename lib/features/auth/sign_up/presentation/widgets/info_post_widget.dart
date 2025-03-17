import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class InfoPostWidget extends StatefulWidget {
  const InfoPostWidget({super.key});

  @override
  State<InfoPostWidget> createState() => _InfoPostWidgetState();
}

final TextEditingController mobileController = TextEditingController();
final TextEditingController userIdController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _InfoPostWidgetState extends State<InfoPostWidget> {
  @override
  void dispose() {
    mobileController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess &&
            state.signUpResponse.status == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sign Up Successful!")),
          );
          Get.toNamed(AppRoutesNames.registerScreen);
        } else if (state is SignUpFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Enter Mobile Number";
                  } else if (p0.length < 10) {
                    return "Enter 10 digits";
                  }

                  return null;
                },
                preFixIcon: const Icon(AppIcons.mobile),
                controller: mobileController,
                hintText: AppString.hintMobile,
              ).paddingSymmetric(vertical: 10),
              CustomTextField(
                keyboardType: TextInputType.number,
                preFixIcon: const Icon(AppIcons.user),
                controller: userIdController,
                hintText: AppString.hintUserId,
              ).paddingSymmetric(vertical: 10),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<SignUpCubit>().postSignupData(
                          userId: int.parse(userIdController.text),
                          mobileNumber: mobileController.text,
                        );
                  }
                },
                text: AppString.signUp,
              ),
            ],
          ),
        );
      },
    );
  }
}
