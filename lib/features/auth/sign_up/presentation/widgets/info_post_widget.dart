import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/routes/app_routes_names.dart';
import 'package:milk_ride_live_wc/core/theme/app_icons.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
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
        if (state is SignUpSuccess) {
          Get.toNamed(AppRoutesNames.registerScreen);
          context.loaderOverlay.hide();
          FunctionalComponent.show(context, AppString.successMessage);
        } else if (state is SignUpFail) {
          context.loaderOverlay.hide();
          FunctionalComponent.show(context, state.message, isError: true);
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
                  return AppValidation.validatePhoneNumber(p0);
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
                    context.loaderOverlay.show();
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
