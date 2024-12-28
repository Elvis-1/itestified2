import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class AnimatedQuotesModal extends StatefulWidget {
  @override
  _AnimatedQuotesModalState createState() => _AnimatedQuotesModalState();
}

class _AnimatedQuotesModalState extends State<AnimatedQuotesModal>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    ));
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return SlideTransition(
      position: _offsetAnimation!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeProvider.themeData.colorScheme.background,
        ),
        padding: EdgeInsets.only(top: 25.w, right: 10.w, left: 10.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppImages.quotesImage,
                fit: BoxFit.cover,
              ),
            ),
            textWidget(
              "Source: Redeemed Christian Church of God",
              fontSize: 14.sp,
              color: themeProvider.themeData.colorScheme.tertiary,
            ),
            SizedBox(
              height: 50.h,
            ),
            btnAndText(
                containerWidth: double.infinity,
                verticalPadding: 15.w,
                text: "Download"),
            SizedBox(
              height: 20.h,
            ),
            btnAndText(
                containerWidth: double.infinity,
                containerColor: AppColors.transparent,
                verticalPadding: 15.w,
                textColor: AppColors.primaryColor,
                text: "Share"),
          ],
        ),
      ),
    );
  }
}
