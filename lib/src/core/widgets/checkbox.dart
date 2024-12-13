import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';

// class CheckBoxWidget extends StatefulWidget {
//   CheckBoxWidget({super.key, required this.index});
//   int index;

//   @override
//   State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
// }

// class _CheckBoxWidgetState extends State<CheckBoxWidget> {
//   bool toggleOn = false;
//   int currentIndex = 0;
//   togglgleCheckbox() {
//     setState(() {
//       currentIndex = widget.index;
//       toggleOn = !toggleOn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             toggleOn = false;
//             currentIndex = 0;
//           });
//           togglgleCheckbox();
//           print('passed index ${widget.index}');
//           print('current index $currentIndex');
//         },
//         child: Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//               color: currentIndex == widget.index && toggleOn
//                   ? AppColors.primaryColor
//                   : AppColors.transparent,
//               borderRadius: BorderRadius.circular(2),
//               border: Border.all(color: AppColors.primaryColor)),
//         ),
//       ),
//     );
//   }
// }

class CheckBoxWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onCheckboxChanged;

  const CheckBoxWidget({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCheckboxChanged(index);
        print('This is index $index');
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.blue),
        ),
      ),
    );
  }
}

class CheckBoxList extends StatefulWidget {
  const CheckBoxList({super.key});

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  int currentIndex = -1; // Initialize to -1, meaning no checkbox is selected.

  void updateCheckboxState(int index) {
    setState(() {
      currentIndex = index; // Update the selected checkbox index.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5, // Replace 5 with the number of checkboxes you need.
        (index) => CheckBoxWidget(
          index: index,
          currentIndex: currentIndex,
          onCheckboxChanged: updateCheckboxState,
        ),
      ),
    );
  }
}
