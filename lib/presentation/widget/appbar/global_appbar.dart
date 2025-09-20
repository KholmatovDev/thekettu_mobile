
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thekettu/core/util/extensions.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    this.title,
    this.actions,
    this.elevation,
    this.leading,
    this.titleWidget,
    this.height,
    this.backgroundColor,
    this.bottom,
    this.centerTitle,
    this.onBack,
    this.titleStyle,
    this.titleAlign,
    this.backIconColor,
    this.toolBarColor,
    this.activeAnimation,
    this.systemUiOverlayStyle,
  });

  final String? title;
  final List<Widget>? actions;
  final double? elevation, height;
  final Widget? leading, titleWidget;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle, activeAnimation;
  final VoidCallback? onBack;
  final TextStyle? titleStyle;
  final TextAlign? titleAlign;
  final Color? backIconColor;
  final Color? toolBarColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemUiOverlayStyle,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leading ??
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: onBack ??
                    () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
            child: "assets/icons/arrow_back.svg".assetSvg(color: backIconColor, size:30.sp).paddingAll(12.spMin),
          ),
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   systemNavigationBarColor: toolBarColor ?? AppColors.white,
      //   statusBarColor: toolBarColor ?? AppColors.white,
      //   statusBarIconBrightness: Brightness.dark,
      //   systemNavigationBarIconBrightness: Brightness.dark,
      // ),
      automaticallyImplyLeading: false,
      title: titleWidget ?? Text(title ?? "", textAlign: titleAlign, style: titleStyle, overflow: TextOverflow.ellipsis),
      bottom: bottom,
      actions: actions,
    ).animate(key: (activeAnimation ?? false) ? UniqueKey() : null).fade().paddingOnly(left: 8.w);
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? AppBar().preferredSize.height);
}