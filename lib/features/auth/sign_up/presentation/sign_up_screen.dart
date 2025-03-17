import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/widgets/info_post_widget.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/presentation/widgets/title_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleWidget(),
          InfoPostWidget(),
        ],
      ).paddingSymmetric(vertical: 30, horizontal: 20),
    );
  }
}
