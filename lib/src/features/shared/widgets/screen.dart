import 'dart:ui';

import 'package:flutter/material.dart';

Widget largeScreenGrid(BuildContext context, Widget child,
    {int gridNumber = 2,
    ScrollPhysics physics = const BouncingScrollPhysics()}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          physics: physics,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridNumber, // Show 2 columns on large screens
            childAspectRatio: 1.5, // Adjust ratio for readability
          ),
          itemCount: 17,
          itemBuilder: (context, i) => child,
        ),
      ),
    ],
  );
}

Widget smallScreenListView(
  Widget child,
) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
          itemBuilder: (context, index) {
            return child;
          }));
}

Widget largeScreenGrid2(BuildContext context, List<Widget> children,
    {int gridNumber = 2,
    ScrollPhysics physics = const BouncingScrollPhysics()}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView(
          shrinkWrap: true,
          physics: physics,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridNumber, // Show 2 columns on large screens
            childAspectRatio: 1.5, // Adjust ratio for readability
          ),
          // itemCount: 17,
          // itemBuilder: (context, i) => child,
          children: children,
        ),
      ],
    ),
  );
}

Widget smallScreenListView2(
  List<Widget> children,
) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromViewPadding(ViewPadding.zero, 0.2),
        children: children,
      ));
}
