import 'package:flutter/material.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/constants/app_validation.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/app_size_box_extension.dart';
import 'package:milk_ride_live_wc/core/theme/app_text_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_title_with_text_field.dart';

class PersonalDetailsWidgets extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const PersonalDetailsWidgets({super.key, required this.formKey});

  @override
  State<PersonalDetailsWidgets> createState() => _PersonalDetailsWidgetsState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

class _PersonalDetailsWidgetsState extends State<PersonalDetailsWidgets> {
  int selectedIndex = 0; // Move it here to persist across rebuilds

  final List<Map<String, dynamic>> people = [
    {
      'gender': 'Male',
      'icon': Icons.male,
    },
    {
      'gender': 'Female',
      'icon': Icons.female,
    },
    {
      'gender': 'Other',
      'icon': Icons.transgender,
    },
  ];

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
                fontWeight: FontWeight.w700,
                fontSize: AppTextSize.s18,
              ),
            ),
            CustomTitleWithTextField(
              validator: (p0) => AppValidation.emptyValue(p0),
              controller: _nameController,
              hintText: AppString.name,
              titleText: AppString.titleName,
            ),
            20.height,
            CustomTitleWithTextField(
              // validator: (p0) => AppValidation.validateEmail(p0),
              controller: _emailController,
              hintText: AppString.email,
              titleText: AppString.titleEmail,
            ),
            20.height,
            CustomText(
              text: AppString.titleGender,
              fontSize: AppTextSize.s14,
              fontWeight: FontWeight.w600,
            ),
            5.height,
            SizedBox(
              height: 40,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 90,
                      margin: EdgeInsets.only(right: 22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            isSelected ? AppColors.primaryColor : Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            people[index]["icon"],
                            color: AppColors.white,
                          ),
                          2.width,
                          CustomText(
                            text: people[index]["gender"],
                            fontSize: AppTextSize.s12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
