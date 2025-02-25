import 'package:flutter/material.dart';

class ScaleAnimationsWidget extends StatefulWidget {
  const ScaleAnimationsWidget(
      {super.key, required this.child, required this.isActive});
  final Widget child;
  final bool isActive;

  @override
  State<ScaleAnimationsWidget> createState() => _ScaleAnimationsWidgetState();
}

class _ScaleAnimationsWidgetState extends State<ScaleAnimationsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scale = Tween<double>(begin: 0.5, end: 1.1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    if (widget.isActive) {
      controller.forward();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScaleAnimationsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
