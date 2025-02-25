import 'package:flutter/material.dart';

class FadeInTransitionWidget extends StatefulWidget {
  const FadeInTransitionWidget({super.key, required this.child});

  final Widget child;

  @override
  State<FadeInTransitionWidget> createState() => _FadeInTransitionWidgetState();
}

class _FadeInTransitionWidgetState extends State<FadeInTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    opacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: opacity, child: widget.child);
  }
}
