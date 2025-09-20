import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:thekettu/core/util/extensions.dart';
import 'package:thekettu/presentation/widget/other/decorated_card.dart';

class OptionsButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const OptionsButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedCard(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
      cardColor: AppColors.flashWhite,
      radius: 15.r,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "assets/icons/Google.svg".assetSvg(),
          10.pw,
          Text(text),
        ],
      ),
    );
  }
}
