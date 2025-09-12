import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CupertinoPage<void> slideTransitionRight(GoRouterState state, Widget page) => CupertinoPage(key: state.pageKey, child: page);

MaterialPage<void> scaleTransition(GoRouterState state, Widget page) => MaterialPage(key: state.pageKey, child: page);

// CustomTransitionPage<void>(
//   transitionDuration: const Duration(milliseconds: 150),
//   reverseTransitionDuration: const Duration(milliseconds: 150),
//   key: state.pageKey,
//   child: page,
//   transitionsBuilder: (context, animation, secondaryAnimation, child) {
//     animation = CurvedAnimation(
//       parent: animation,
//       curve: Curves.linear,
//       reverseCurve: Curves.linear,
//     );
//     return SlideTransition(
//       position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
//       child: child,
//     );
//   },
// );

CustomTransitionPage<void> bottomTransition(GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.linear);
      return SlideTransition(
        position: Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },
  );
}

CustomTransitionPage<void> fadeTransition(GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 20),
    reverseTransitionDuration: const Duration(milliseconds: 20),
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: page,
      );
    },
  );
}
