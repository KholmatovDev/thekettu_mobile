import 'package:go_router/go_router.dart';
import 'package:thekettu/core/service/navigation/routing.dart';
import 'package:thekettu/presentation/pages/auth/auth_screen.dart';
import 'package:thekettu/presentation/pages/home/home_screen.dart';
import 'package:thekettu/presentation/pages/profile/personal/personal_data_screen.dart';

import '../transition/transitions.dart';
import 'navigation_service.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: RoutingConstants.authScreen,
    routes: [
      GoRoute(
        path: RoutingConstants.authScreen,
        pageBuilder: (context, state) => slideTransitionRight(state, const LoginScreen()),
      ),
      GoRoute(
        path: RoutingConstants.homeScreen,
        pageBuilder: (context, state) => slideTransitionRight(state, const HomeScreen()),
      ),
      GoRoute(
        path: RoutingConstants.personalDataScreen,
        pageBuilder: (context, state) => slideTransitionRight(state, const PersonalDataScreen()),
      ),
    ],
  );
}
