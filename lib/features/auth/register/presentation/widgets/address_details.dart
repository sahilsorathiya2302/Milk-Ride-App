import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';

class AddressDetails extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AddressDetails({super.key, required this.formKey});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: AppString.address,
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s18,
              ),
            ),
            30.height,
            Row(
              children: [
                Expanded(
                    child: CustomTitleWithTextField(
                  validator: (p0) => AppValidation.emptyValue(p0),
                  titleText: AppString.titleHouseNo,
                  hintText: AppString.houseNumber,
                )),
                10.width,
                Expanded(
                  child: CustomTitleWithTextField(
                    titleText: AppString.titleFloor,
                    hintText: AppString.floor,
                  ),
                ),
              ],
            ),
            11.height,
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleSocietyName,
              hintText: AppString.society,
            ),
            11.height,
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleLandMarks,
              hintText: AppString.lendMark,
            ),
            11.height,
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleCity,
              hintText: AppString.city,
            ),
            11.height,
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleArea,
              hintText: AppString.area,
            ),
            11.height,
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titlePinCode,
              hintText: AppString.pinCode,
            ),
          ],
        ),
      ),
    );
  }
}
