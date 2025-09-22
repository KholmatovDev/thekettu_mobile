import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thekettu/core/service/navigation/routing.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:thekettu/core/util/extensions.dart';
import 'package:thekettu/presentation/pages/auth/bloc/auth_cubit.dart';
import 'package:thekettu/presentation/widget/buttons/global_button.dart';
import 'package:thekettu/presentation/widget/buttons/options_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final images = [
    "https://images.unsplash.com/photo-1559305616-3f99cd43e353?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1601065700897-d9fa1c093f3e?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1529676468696-f3a47aba7d5d?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];
  final titles = [
    "Discover Stories From Every Journey",
    "Discover the World with Travora",
    "And I dont know",
  ];
  final subtitles = [
    "Curated travel stories and local tips from explorers around the world",
    "Get inspired by stories, guides, and real journeys from travelers",
    "Arono bro arono arono are you know or not speak for become",
  ];
  final PageController pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: CachedNetworkImage(
                  height: double.infinity,
                  key: ValueKey<String>(images[currentPage]),
                  imageUrl: images[currentPage],
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 600),
                  fadeOutDuration: const Duration(milliseconds: 300),
                ),
              ),
              Positioned(
                bottom: 14,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: 292.h,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: pageController,
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      currentPage = value;
                      setState(() {});
                    },
                    itemBuilder: (context, index) => Container(
                      decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.elliptical(50, 50))),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                titles[currentPage],
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              10.ph,
                              Text(
                                subtitles[currentPage],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              ).paddingSymmetric(horizontal: 10.w),
                            ],
                          ).expanded(),
                          currentPage == 2
                              ? OptionsButton(
                                  text: "Ro'yxatdan o'tish",
                                  onTap: () {
                                    // context.read<AuthCubit>().login();
                                    context.push(RoutingConstants.personalDataScreen);
                                  },
                                ).paddingSymmetric(horizontal: 30.w)
                              : GlobalButton(
                                  text: "Next",
                                  type: ButtonType.blue,
                                  onTap: () {
                                    pageController.animateToPage(index + 1, duration: const Duration(milliseconds: 1000), curve: Curves.fastLinearToSlowEaseIn);
                                  },
                                ).paddingSymmetric(horizontal: 67.w),
                        ],
                      ).paddingSymmetric(horizontal: 9.w, vertical: 29.h),
                    ).paddingSymmetric(horizontal: 24.w),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
