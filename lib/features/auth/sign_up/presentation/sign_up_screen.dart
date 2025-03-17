import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTitle(text: AppString.signUp),
          CustomTextField(
                  controller: mobileController, hintText: AppString.hintMobile)
              .paddingSymmetric(vertical: 10),
          CustomTextField(
              controller: userIdController, hintText: AppString.hintUserId),
        ],
      ).paddingSymmetric(vertical: 30, horizontal: 20),
    );
  }
}
