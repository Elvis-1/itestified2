import 'package:flutter/material.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/core/widgets/textwidget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/search/presentation/screens/search_screen.dart';
import 'package:provider/provider.dart';


class AppBarConfig {
  static const double heightSmall = 60;
  static const double heightMedium = 70;
  static const double heightLarge = 80;
  static const double heightExtraLarge = 100;


  static const double mobileSmall = 360;
  static const double mobileMedium = 480;
  static const double mobileLarge = 600;
  static const double tablet = 768;

}

PreferredSizeWidget generalAppbar(String title, BuildContext context) {
  final themeProvider = Provider.of<ThemeViewmodel>(context);
  final screenWidth = MediaQuery.of(context).size.width;
  
  return PreferredSize(
    preferredSize: Size.fromHeight(_getAppBarHeight(screenWidth)),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: themeProvider.themeData.colorScheme.onTertiary,
                size: _getIconSize(screenWidth),
              ),
              padding: EdgeInsets.all(_getIconPadding(screenWidth)),
            ),
            Expanded(
              child: Center(
                child: TextWidgets.textWidget20(
                  context, 
                  title,
                  mainColor: themeProvider.themeData.colorScheme.onTertiary,
      
                ),
              ),
            ),
            SizedBox(width: _getIconSize(screenWidth) + (_getIconPadding(screenWidth) * 2)),
          ],
        ),
      ),
    ),
  );
}


PreferredSizeWidget generalAppBar2(BuildContext context) {
  final themeProvider = Provider.of<ThemeViewmodel>(context);
  final authProvider = Provider.of<AuthViewModel>(context);
  final isGuest = authProvider.isGuest;
  final screenWidth = MediaQuery.of(context).size.width;
  
  final appBarHeight = _getAppBarHeight(screenWidth, isGuest: isGuest);

  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: themeProvider.themeData.colorScheme.surface,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenWidth),
        ),
        child: isGuest
            ? _GuestModeAppBar(screenWidth: screenWidth)
            : _AuthenticatedAppBar(
                screenWidth: screenWidth,
                themeProvider: themeProvider,
              ),
      ),
    ),
  );
}

// Guest Mode App Bar
class _GuestModeAppBar extends StatelessWidget {
  final double screenWidth;

  const _GuestModeAppBar({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    if (screenWidth < AppBarConfig.mobileSmall) {
      return _GuestModeVertical(screenWidth: screenWidth);
    } else {
      return _GuestModeHorizontal(screenWidth: screenWidth);
    }
  }
}

class _GuestModeVertical extends StatelessWidget {
  final double screenWidth;

  const _GuestModeVertical({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _GuestModeInfo(screenWidth: screenWidth),
        SizedBox(height: _getSpacing(screenWidth)),
        _CreateAccountButton(
          screenWidth: screenWidth,
          fullWidth: true,
        ),
      ],
    );
  }
}

class _GuestModeHorizontal extends StatelessWidget {
  final double screenWidth;

  const _GuestModeHorizontal({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: _GuestModeInfo(screenWidth: screenWidth),
        ),
        SizedBox(width: _getSpacing(screenWidth)),
        Flexible(
          flex: 2,
          child: _CreateAccountButton(
            screenWidth: screenWidth,
            fullWidth: false,
          ),
        ),
      ],
    );
  }
}

class _GuestModeInfo extends StatelessWidget {
  final double screenWidth;

  const _GuestModeInfo({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWidgets.textWidget14(
          context,
          "Guest Mode",
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: _getSpacing(screenWidth) / 2),
        TextWidgets.textWidget10(
          context,
          "You are currently browsing as a guest",
          fontWeight: FontWeight.w400,
  
          maxLines: 2,
        ),
      ],
    );
  }
}


class _CreateAccountButton extends StatelessWidget {
  final double screenWidth;
  final bool fullWidth;

  const _CreateAccountButton({
    required this.screenWidth,
    required this.fullWidth,
  });

  @override
  Widget build(BuildContext context) {
    final buttonText = screenWidth < AppBarConfig.tablet
        ? "Create Account"
        : "Create an Account";
    
    final buttonWidth = fullWidth
        ? double.infinity
        : _getButtonWidth(screenWidth);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpScreen.routeName);
      },
      child: btnAndText(
        text: buttonText,
        containerWidth: buttonWidth,
        verticalPadding: _getButtonPadding(screenWidth),
        fontSize: _getButtonFontSize(screenWidth),
      ),
    );
  }
}


class _AuthenticatedAppBar extends StatelessWidget {
  final double screenWidth;
  final ThemeViewmodel themeProvider;

  const _AuthenticatedAppBar({
    required this.screenWidth,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: _UserInfo(
            screenWidth: screenWidth,
            themeProvider: themeProvider,
          ),
        ),
        _ActionButtons(
          screenWidth: screenWidth,
          themeProvider: themeProvider,
        ),
      ],
    );
  }
}

class _UserInfo extends StatelessWidget {
  final double screenWidth;
  final ThemeViewmodel themeProvider;

  const _UserInfo({
    required this.screenWidth,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = _getUserIconSize(screenWidth);
    final spacing = _getSpacing(screenWidth);
    
    return Row(
      children: [
        Image.asset(
          AppIcons.userIcon,
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(width: spacing),
        Flexible(
          child: TextWidgets.textWidget14(
            context,
            "Welcome, Amaka",
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final double screenWidth;
  final ThemeViewmodel themeProvider;

  const _ActionButtons({
    required this.screenWidth,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final avatarRadius = _getAvatarRadius(screenWidth);
    final iconSize = _getIconSize(screenWidth);
    final spacing = _getSpacing(screenWidth);
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CircularButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
          icon: Icons.search,
          avatarRadius: avatarRadius,
          iconSize: iconSize,
          themeProvider: themeProvider,
        ),
        SizedBox(width: spacing),
        _CircularButton(
          onTap: () {
            // TODO: Navigate to notifications
          },
          icon: Icons.notifications_outlined,
          avatarRadius: avatarRadius,
          iconSize: iconSize,
          themeProvider: themeProvider,
        ),
      ],
    );
  }
}

// Circular Action Button
class _CircularButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double avatarRadius;
  final double iconSize;
  final ThemeViewmodel themeProvider;

  const _CircularButton({
    required this.onTap,
    required this.icon,
    required this.avatarRadius,
    required this.iconSize,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(avatarRadius),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: themeProvider
              .themeData.searchBarTheme.backgroundColor!
              .resolve({}),
          child: Icon(
            icon,
            size: iconSize,
            color: themeProvider.themeData.colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget appBar(BuildContext context, String title) {
  final themeProvider = Provider.of<ThemeViewmodel>(context);

  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: themeProvider.themeData.colorScheme.surface,
    elevation: 0,
    title: textWidget(
      title,
      fontWeight: FontWeight.w600,
    ),
  );
}

// Responsive Helper Functions
double _getAppBarHeight(double screenWidth, {bool isGuest = false}) {
  if (isGuest && screenWidth < AppBarConfig.mobileSmall) {
    return AppBarConfig.heightExtraLarge;
  }
  if (screenWidth < AppBarConfig.mobileLarge) {
    return AppBarConfig.heightSmall;
  }

  return AppBarConfig.heightLarge;
}

double _getHorizontalPadding(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileSmall) return 8;
  if (screenWidth < AppBarConfig.mobileLarge) return 12;
  if (screenWidth < AppBarConfig.tablet) return 16;
 
  return 24;
}

double _getSpacing(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileSmall) return 8;
  if (screenWidth < AppBarConfig.mobileLarge) return 12;
  if (screenWidth < AppBarConfig.tablet) return 16;
  return 20;
}

double _getIconSize(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileSmall) return 18;
  if (screenWidth < AppBarConfig.mobileLarge) return 20;
  if (screenWidth < AppBarConfig.tablet) return 22;
  return 24;
}

double _getIconPadding(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileLarge) return 8;
  return 12;
}

double _getUserIconSize(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileSmall) return 20;
  if (screenWidth < AppBarConfig.mobileLarge) return 22;
  if (screenWidth < AppBarConfig.tablet) return 24;
  return 28;
}

double _getAvatarRadius(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileSmall) return 16;
  if (screenWidth < AppBarConfig.mobileLarge) return 18;
  if (screenWidth < AppBarConfig.tablet) return 20;
  return 22;
}

double _getButtonWidth(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileMedium) return 100;
  if (screenWidth < AppBarConfig.mobileLarge) return 110;
  if (screenWidth < AppBarConfig.tablet) return 120;
  return 150;
}

double _getButtonPadding(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileMedium) return 6;
  if (screenWidth < AppBarConfig.mobileLarge) return 8;
  if (screenWidth < AppBarConfig.tablet) return 10;
  return 12;
}

double _getButtonFontSize(double screenWidth) {
  if (screenWidth < AppBarConfig.mobileMedium) return 10;
  if (screenWidth < AppBarConfig.mobileLarge) return 12;
  if (screenWidth < AppBarConfig.tablet) return 14;
  return 16;
}

class appbar2 extends StatelessWidget {
  const appbar2(
    this.title, {
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                AppIcons.backIcon,
                color: themeProvider.themeData.colorScheme.onTertiary,
              )),
          textWidget(title,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: themeProvider.themeData.colorScheme.onTertiary),
          Container()
        ],
      ),
    );
    
  }
}

