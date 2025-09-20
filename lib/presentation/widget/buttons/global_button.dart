import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final ButtonType type;
  const GlobalButton({super.key, required this.text,  this.onTap,  this.type = ButtonType.blue});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color:type == ButtonType.blue? AppColors.primaryBlue: AppColors.darkCharcoalBlue,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 23.h),
        child:  Text(
          text,
          style: const TextStyle(fontSize: 16, color: AppColors.white),
        ),
      ),
    );
  }
}
enum ButtonType {blue, darkBlue, }