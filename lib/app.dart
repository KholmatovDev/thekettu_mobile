import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thekettu/core/service/navigation/navigation_service.dart';
import 'package:thekettu/core/service/navigation/routing.dart';
import 'package:thekettu/presentation/pages/auth/bloc/auth_cubit.dart';
import 'package:thekettu/presentation/pages/home/home_screen.dart';
import 'core/service/navigation/go_router.dart';
import 'data/service/di/service_locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppGoRouter();
  final appLinks = AppLinks();

  @override
  void initState() {
    appLinks.uriLinkStream.listen((uri) {
      sl<AuthCubit>().login(token: uri.queryParameters["token"].toString(), success: () => NavigationService.navigatorKey.currentContext!.push(RoutingConstants.personalDataScreen));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: ScreenUtilInit(
        splitScreenMode: true,
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp.router(
              color: Colors.white,
              routerConfig: router.router,
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
