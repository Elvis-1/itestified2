import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterDownTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    String minutes =
        (authVM.seconddsRemainingForResetPass ~/ 60).toString().padLeft(2, '0');
    String seconds =
        (authVM.seconddsRemainingForResetPass % 60).toString().padLeft(2, '0');
    return Text(
      '$minutes : $seconds',
      style: normalTextStyle(textColor: AppColors.primaryColor),
    );
  }
}
// class CounterDownTimer extends StatefulWidget {
//   CounterDownTimer({
//     super.key,
//   });

//   @override
//   State<CounterDownTimer> createState() => _CounterDownTimerState();
// }

// class _CounterDownTimerState extends State<CounterDownTimer> {
//   late Timer _timer;
//   // 5 min

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final authVM = Provider.of<AuthViewModel>(context, listen: false);

//       authVM.startTimer();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authVM = Provider.of<AuthViewModel>(context);
//     String minutes =
//         (authVM.seconddsRemainingForResetPass ~/ 60).toString().padLeft(2, '0');
//     String seconds =
//         (authVM.seconddsRemainingForResetPass % 60).toString().padLeft(2, '0');
//     return Text(
//       '$minutes : $seconds',
//       style: normalTextStyle(textColor: AppColors.primaryColor),
//     );
//   }
// }
