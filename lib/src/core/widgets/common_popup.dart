import 'package:flutter/material.dart';
import 'package:itestified/src/core/widgets/dialog_loading.dart';
import 'package:lottie/lottie.dart';

class CommonPopup {
  static Future<void> showLoading(BuildContext context,
      {bool close = false, String message = ""}) {
    // hapticSelection();
    if (close) {
      Navigator.of(context, rootNavigator: true).pop();
      return Future.value();
    }

    return showGeneralDialog(
      context: context,
      barrierDismissible: false, // Prevents user from dismissing dialog
      barrierColor: Colors.transparent, // Makes background fully transparent
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          // Show animation at center of screen
          child: SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset('assets/animations/itest_anim.json.zip'),
          ),
        );
      },
    );

    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return DialogLoading(
    //         subtitle: Text(
    //           message,
    //           style: Theme.of(context).textTheme.titleLarge,
    //         ),
    //       );
    //     },
    //     barrierDismissible: true);
  }

  static void closeLoading(BuildContext context) {
    //check if the top stack is a loading screen
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;
      return !isVisible;
    });

    if (isVisible) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
