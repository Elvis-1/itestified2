import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/features/add_testimony/presentation/screens/add_testimony.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/categories_screen.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:itestified/src/features/home/presentation/home_screen.dart';
import 'package:itestified/src/features/nav/bottom_nav.dart';
import 'package:itestified/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pageList = [
    const HomeScreen(),
    const CategoriesListScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];
  int pageIndex = 0;
  Color color = Colors.white;
  void changePage(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.background,
      body: pageList[pageIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: themeProvider.themeData.colorScheme.outline)),
            borderRadius: BorderRadius.circular(15),
            color: themeProvider.themeData.colorScheme.background,
          ),
          padding: EdgeInsets.all(5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNav(
                text: "Home",
                index: 0,
                onTap: () {
                  changePage(0);
                },
                iconColor: pageIndex == 0
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                textColor: pageIndex == 0
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                icon: AppIcons.homeIcon,
              ),
              BottomNav(
                text: "Category",
                index: 1,
                onTap: () {
                  changePage(1);
                },
                textColor: pageIndex == 1
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                iconColor: pageIndex == 1
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                icon: AppIcons.catIcon,
              ),
              GestureDetector(
                onTap: () async {
                  await showJoinOurCommunityDialogOverlay(context, 'Join');
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primaryColor),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
              ),
              BottomNav(
                text: "Favorites",
                index: 2,
                onTap: () {
                  changePage(2);
                },
                textColor: pageIndex == 2
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                iconColor: pageIndex == 2
                    ? AppColors.primaryColor
                    : themeProvider.themeData.colorScheme.tertiary,
                icon: AppIcons.favoriteIcon,
              ),
              BottomNav(
                  text: "Profile",
                  index: 3,
                  onTap: () {
                    changePage(3);
                  },
                  textColor: pageIndex == 3
                      ? AppColors.primaryColor
                      : themeProvider.themeData.colorScheme.tertiary,
                  iconColor: pageIndex == 3
                      ? AppColors.primaryColor
                      : themeProvider.themeData.colorScheme.tertiary,
                  icon: AppIcons.profileIcon),
            ],
          ),
        ),
      ),
    );
  }
}
