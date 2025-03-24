import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text_field.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

final TextEditingController _nameController = TextEditingController();

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _nameController,
                hintText: AppString.name,
              ).paddingSymmetric(vertical: 5),
            ),
            SizedBox(width: 10), // Optional spacing between the fields
            Expanded(
              child: CustomTextField(
                controller: _nameController,
                hintText: AppString.email,
              ).paddingSymmetric(vertical: 5),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 10);
  }
}
