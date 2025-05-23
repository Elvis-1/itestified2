import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogLoading extends StatelessWidget {
  final Widget? subtitle;
  final Duration? duration;

  const DialogLoading({super.key, this.subtitle, this.duration});

  @override
  Widget build(BuildContext context) {
    if (duration != null) {
      // we use the parent context to close the dialog
      Timer(duration!, () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: WillPopScope(
        onWillPop: () async => false,
        child: WidgetLoading(subtitle: subtitle),
      ),
    );
  }
}

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({
    super.key,
    this.subtitle,
  });

  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: BoxDecoration(color: Colors.transparent),
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 87,
              width: 87,
              child: Lottie.asset(
                'assets/animations/itest_anim.json.zip',
              ),
            ),
            // Image(
            //   image: AssetImage(
            //     kLoadingAnim,
            //   ),
            // ),
          ),
          subtitle ?? Container(),
        ],
      ),
    );
  }
}
