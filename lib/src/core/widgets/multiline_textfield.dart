import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';



class MultilineTextField extends StatefulWidget {
  const MultilineTextField({
    super.key,
    this.hintText = "Enter details of your testimony ...",
    this.maxLength = 3000,
  });

  final String hintText;
  final int maxLength;

  @override
  State<MultilineTextField> createState() => _MultilineTextFieldState();
}

class _MultilineTextFieldState extends State<MultilineTextField> {
  final TextEditingController _controller = TextEditingController();
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateCharCount);
  }

  void _updateCharCount() {
    setState(() {
      _charCount = _controller.text.length;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCharCount);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    final remainingChars = widget.maxLength - _charCount;

    return Container(
      width: 345,
      height: 218,
      decoration: BoxDecoration(
        color:  themeProvider.themeData.colorScheme.outline,
        border: Border.all(
             color:  themeProvider.themeData.colorScheme.outline,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: widget.maxLength,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(13),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color:  themeProvider.themeData.colorScheme.tertiary,
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                ),
                counterText: '',
              ),
              buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) {
                return const SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$_charCount/${widget.maxLength}',
                  style: TextStyle(
                    color: _charCount > widget.maxLength
                        ? Colors.red
                        :  themeProvider.themeData.colorScheme.tertiary,
                    fontSize: 12,
                  ),
                ),
                if (remainingChars < 100)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '($remainingChars remaining)',
                      style: TextStyle(
                        color: remainingChars < 0 ? Colors.red : Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget multilineTextField(
//     {String hintText = "Enter details of your testimony ..."}) {
//   return Container(
//     height: 250.h,
//     decoration: BoxDecoration(
//         color: AppColors.lightBlack,
//         border: Border.all(color: AppColors.transparent)),
//     width: double.infinity,
//     child: TextFormField(
//       textInputAction: TextInputAction.newline,
//       keyboardType: TextInputType.multiline,
//       maxLines: null,
//       style: normalTextStyle(fontSize: 18, textColor: AppColors.textColor),
//       decoration: InputDecoration(
//           border: InputBorder.none,
//           //  suffixIcon: suffixIcon,
//           //    prefixIcon: prefixIc,
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
//           hintText: hintText,
//           hintStyle:
//               normalTextStyle(textColor: AppColors.textColor, fontSize: 18.sp)),
//     ),
//   );
// }
