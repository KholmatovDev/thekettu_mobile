import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thekettu/core/assets/app_svg.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:thekettu/core/util/extensions.dart';
import 'package:thekettu/presentation/widget/buttons/global_button.dart';
import 'package:thekettu/presentation/widget/textField/global_text_field.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    40.ph,
                    Text(
                      "Added Your Profile",
                      style: 28.bold(),
                    ),
                    10.ph,
                    Text(
                      "Complete your basic profile info",
                      style: 12.regular(),
                    ),
                    20.ph,

                    /// Avatar + edit icon
                    SizedBox(
                      width: 110.w,
                      height: 110.h,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            maxRadius: 50,
                            foregroundImage: CachedNetworkImageProvider(
                              "https://i.pinimg.com/236x/68/31/12/68311248ba2f6e0ba94ff6da62eac9f6.jpg",
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                color: AppColors.flashWhite,
                                shape: BoxShape.circle,
                              ),
                              child: AppSvg.edit
                                  .assetSvg(color: AppColors.primaryBlue)
                                  .paddingAll(13.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.ph,

                    /// TextFields
                    const GlobalTextField(
                      hintText: "Calvin Allister",
                    ),
                    10.ph,
                    const GlobalTextField(
                      hintText: "calvinallister@email.com",
                    ),
                    10.ph,
                    const GlobalTextField(
                      hintText: "Share your thoughts in here...",
                      height: 200,
                    ),
                    30.ph,
                  ],
                ),
              ),
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSvg.check.assetSvg(),
                5.pw,
                Text(
                  "By proceeding, you agree to our Terms & Privacy Policy",
                  style: 12.regular(),
                  maxLines: 2,
                ),
              ],
            ),
            13.ph,
            GlobalButton(text: "Finish")
                .paddingSymmetric(horizontal: 67.w),
            10.ph,
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
