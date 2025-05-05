import 'package:flutter/material.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/dialog.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/categories_screen.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:itestified/src/features/home/presentation/home_screen.dart';
import 'package:itestified/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class NavProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.icon,
    required this.index,
    required this.onTap,
    required this.textColor,
    required this.isSelected,
    required this.text,
  });

  final IconData icon;
  final int index;
  final void Function()? onTap;
  final Color textColor;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: Icon(
              icon,
              color: textColor,
              size: 24,
              fill: isSelected ? 1.0 : 0.0,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.initialPage, this.initialIndex = 0});

  static const routeName = '/nav-bar';
  final Widget? initialPage;
  final int initialIndex;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late List<Widget> pageList;
  late int pageIndex;

  @override
  void initState() {
    super.initState();
    pageList = [
      const HomeScreen(),
      const CategoriesListScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
    pageIndex = widget.initialIndex;

    if (widget.initialPage != null) {
      pageList = [...pageList, widget.initialPage!];
      pageIndex = pageList.length - 1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<NavProvider>(context, listen: false).changeIndex(pageIndex);
  }

  void changePage(int index) {
    final navProvider = Provider.of<NavProvider>(context, listen: false);
    setState(() {
      pageIndex = index;
    });
    navProvider.changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final navProvider = Provider.of<NavProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth >= 600;

          return Row(
            children: [
              if (isLargeScreen)
                NavigationRail(
                  selectedIndex: navProvider.currentIndex,
                  onDestinationSelected: (index) => changePage(index),
                  labelType: NavigationRailLabelType.selected,
                  backgroundColor: themeProvider.themeData.colorScheme.surface,
                  leading: GestureDetector(
                    onTap: () async {
                      await showJoinOurCommunityDialogOverlay(context, 'Join');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(Icons.add, color: AppColors.white),
                    ),
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(
                        Symbols.home,
                        color: navProvider.currentIndex == 0
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        fill: navProvider.currentIndex == 0 ? 1.0 : 0.0,
                      ),
                      label: const Text("Home"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Symbols.dashboard,
                        color: navProvider.currentIndex == 1
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        fill: navProvider.currentIndex == 1 ? 1.0 : 0.0,
                      ),
                      label: const Text("Category"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Symbols.favorite,
                        color: navProvider.currentIndex == 2
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        fill: navProvider.currentIndex == 2 ? 1.0 : 0.0,
                      ),
                      label: const Text("Favorites"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Symbols.person,
                        color: navProvider.currentIndex == 3
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        fill: navProvider.currentIndex == 3 ? 1.0 : 0.0,
                      ),
                      label: const Text("Profile"),
                    ),
                  ],
                ),
              Expanded(
                child: pageList[navProvider.currentIndex],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 600
            ? SafeArea(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: themeProvider.themeData.colorScheme.outline,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: themeProvider.themeData.colorScheme.surface,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomNav(
                        text: "Home",
                        index: 0,
                        onTap: () => changePage(0),
                        textColor: navProvider.currentIndex == 0
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        isSelected: navProvider.currentIndex == 0,
                        icon: Symbols.home,
                      ),
                      BottomNav(
                        text: "Category",
                        index: 1,
                        onTap: () => changePage(1),
                        textColor: navProvider.currentIndex == 1
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        isSelected: navProvider.currentIndex == 1,
                        icon: Symbols.dashboard,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showJoinOurCommunityDialogOverlay(
                              context, 'Join');
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(Icons.add, color: AppColors.white),
                        ),
                      ),
                      BottomNav(
                        text: "Favourite",
                        index: 2,
                        onTap: () => changePage(2),
                        textColor: navProvider.currentIndex == 2
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        isSelected: navProvider.currentIndex == 2,
                        icon: Symbols.favorite,
                      ),
                      BottomNav(
                        text: "Profile",
                        index: 3,
                        onTap: () => changePage(3),
                        textColor: navProvider.currentIndex == 3
                            ? AppColors.primaryColor
                            : themeProvider.themeData.colorScheme.tertiary,
                        isSelected: navProvider.currentIndex == 3,
                        icon: Symbols.person,
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
