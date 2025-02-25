import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          padding: const EdgeInsets.only(top: 25, right: 10, left: 10),
          width: double.infinity,
          child: LayoutBuilder(
            builder: (context, contraints) {
              bool isLargeScreen = contraints.maxWidth > 600;
              return isLargeScreen
                  ? largeScreen(context)
                  : smallScreenContent(context);
            },
          )),
    );
  }
}

Widget smallScreenContent(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      imageAndText(context),
      const SizedBox(
        height: 50,
      ),
      buttons()
    ],
  );
}

Widget largeScreen(BuildContext context) {
  return Expanded(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(width: 300, child: imageAndText(context)),
      SizedBox(width: 200, child: buttons())
    ]),
  );
}

Widget buttons() {
  return Column(
    children: [
      btnAndText(
          containerWidth: double.infinity,
          verticalPadding: 15,
          text: "Download"),
      const SizedBox(
        height: 20,
      ),
      btnAndText(
          containerWidth: double.infinity,
          containerColor: AppColors.transparent,
          verticalPadding: 15,
          textColor: AppColors.primaryColor,
          text: "Share"),
    ],
  );
}

Widget imageAndText(BuildContext context) {
  var themeProvider = Provider.of<ThemeViewmodel>(context);

  return Column(
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
        fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
        color: themeProvider.themeData.colorScheme.tertiary,
      ),
    ],
  );
}
