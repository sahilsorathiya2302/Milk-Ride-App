import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milk_ride_live_wc/core/theme/app_colors.dart';
import 'package:milk_ride_live_wc/core/theme/icon_size.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? leadingOnPressed;
  final void Function()? actionOnPressed;
  final IconData leadingIcon;
  final IconData? actionIcon;
  final String? imageName;
  final String? titleName;
  const CustomAppBar(
      {super.key,
      this.leadingOnPressed,
      required this.leadingIcon,
      this.imageName,
      this.titleName,
      this.actionIcon,
      this.actionOnPressed});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100, 50.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: IconButton(
          onPressed: widget.leadingOnPressed,
          icon: Icon(
            widget.leadingIcon,
            color: AppColors.black,
            size: IconSize.i30,
          )),
      title: widget.imageName != null
          ? Image.asset(
              widget.imageName.toString(),
              height: 130.h,
              width: 130.w,
            )
          : CustomText(text: widget.titleName.toString()),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: widget.actionOnPressed,
          icon: Icon(
            widget.actionIcon,
            color: AppColors.black,
            size: IconSize.i30,
          ),
        )
      ],
    );
  }
}
