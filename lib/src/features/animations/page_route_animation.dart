import 'package:flutter/material.dart';
import 'package:itestified/src/features/animations/fade_in_trans.dart';

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionDuration: const Duration(milliseconds: 1500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // final tween = Tween(
            //   begin: const Offset(-1, -1),
            //   end: Offset.zero,
            // ).animate(
            //   CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            // );

            return FadeInTransitionWidget(child: child);
            // SlideTransition(
            //   position: tween,
            //   child: child,
            // );
          },
        );
}
