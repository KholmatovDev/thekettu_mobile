import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thekettu/core/util/extensions.dart';

import '../../../core/assets/app_svg.dart';
import '../../../core/theme/app_colors.dart';

class GlobalTextField extends StatelessWidget {
  final String? hintText;
  final double? height;
  final ValueChanged<String>? onChanged;

  const GlobalTextField({super.key, this.hintText, this.onChanged, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        maxLines: null,
        expands: height != null,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: AppColors.primaryBlue)),
          fillColor: AppColors.flashWhite,
          hintText: hintText,
          hintStyle: 12.medium(color: AppColors.grey),
          filled: true,

          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          // suffixIcon: AppSvg.edit.assetSvg(size: 24.spMin).paddingSymmetric(vertical: 13.h),
        ),
      ),
    );
  }
}
