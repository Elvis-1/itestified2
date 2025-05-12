import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/animated_quotes_modal.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class quoteContainer extends StatelessWidget {
  const quoteContainer(
      {super.key,
      this.rightPadding = 15,
      this.imageWidth = 270,
      this.containerHeight = 170,
      this.textSize = 12,
      this.inbetweenHeight = 1});
  final double rightPadding;
  final double imageWidth;
  final double containerHeight;
  final double inbetweenHeight;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
        margin: EdgeInsets.only(
            right: rightPadding, left: rightPadding, bottom: 10),
        width: 250,
        height: 200,
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // quotes container
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AnimatedQuotesModal();
                    });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                height: containerHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(AppImages.quotesImage),
                        fit: BoxFit.cover)),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white
                            //AppColors.opaqueBlack,
                            ,
                            child: Icon(
                              size: 15,
                              Icons.favorite_outline,
                              color: AppColors.blackColor,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: inbetweenHeight,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: textWidget(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "Source: Redeemed Christian Church of God, Source: Redeemed Christian Church of God, Source: Redeemed Christian Church of God",
                      fontSize: textSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
