import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thekettu/app.dart';
import 'package:thekettu/core/assets/app_images.dart';
import 'package:thekettu/core/assets/app_svg.dart';
import 'package:thekettu/core/assets/typography.dart';
import 'package:thekettu/core/service/navigation/routing.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:thekettu/core/util/extensions.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(3000.ms,(){
      context.push(RoutingConstants.authScreen);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.primaryBlue,
        ),
      ),
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          AppImages.ornament.assetImage().animate(effects: [FadeEffect(duration: 2000.ms)]),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvg.appLogo.assetSvg(),
                    Text("The Kettu", style: 52.bold(color: AppColors.white)).animate(),
                    SizedBox(
                      width: 10.h,
                      height: 10.w,
                      child: const CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Text(
                  textAlign: TextAlign.center,
                  "Travora brings travel stories to life  anytime, anywhere, beautifully",
                  style: 12.regular(color: AppColors.white),
                ).paddingSymmetric(horizontal: 54.w).paddingOnly(bottom: 15.h),
              ),
            ],
          ),
        ],
      ).animate(effects: [FadeEffect(duration: 500.ms)]),
    );
  }
}
