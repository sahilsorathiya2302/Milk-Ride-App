import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_border_radius.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';

class PersonalDetailsWidgets extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String name, String email, String gender)
      onPersonalDetailsChanged;

  const PersonalDetailsWidgets({
    super.key,
    required this.formKey,
    required this.onPersonalDetailsChanged,
  });

  @override
  State<PersonalDetailsWidgets> createState() => _PersonalDetailsWidgetsState();
}

class _PersonalDetailsWidgetsState extends State<PersonalDetailsWidgets> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  int selectedValue = -1;
  String gender = "";

  final List<Map<String, dynamic>> people = [
    {'gender': 'Male', 'icon': Icons.male},
    {'gender': 'Female', 'icon': Icons.female},
    {'gender': 'Other', 'icon': Icons.transgender},
  ];

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updatePersonalDetails);
    _emailController.addListener(_updatePersonalDetails);
  }

  void _updatePersonalDetails() {
    widget.onPersonalDetailsChanged(
      _nameController.text,
      _emailController.text,
      gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                text: AppString.personal,
                fontSize: AppTextSize.s18,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              titleText: AppString.titleName,
              controller: _nameController,
              hintText: AppString.name,
            ),
            20.height,
            CustomTitleWithTextField(
              titleText: AppString.titleEmail,
              controller: _emailController,
              hintText: AppString.email,
            ),
            20.height,
            CustomText(
              text: AppString.titleGender,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w600,
            ),
            5.height,
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedValue == index;

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.r14),
                        side: BorderSide(
                          color: isSelected ? AppColors.white : AppColors.black,
                        ),
                      ),
                      backgroundColor:
                          isSelected ? AppColors.primaryColor : AppColors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedValue = index;
                        gender = people[index]["gender"];
                      });
                      _updatePersonalDetails();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          people[index]["icon"],
                          color: isSelected ? AppColors.white : AppColors.black,
                        ),
                        const SizedBox(width: 2),
                        CustomText(
                          text: people[index]["gender"],
                          fontSize: AppTextSize.s12,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? AppColors.white : AppColors.black,
                        ),
                      ],
                    ),
                  ).paddingOnly(right: 4, bottom: 5);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
  }
}
