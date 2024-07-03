import 'package:flutter/widgets.dart';

class AppIcons {
  static const double _size = 24;
  static searchIcon() => _iconContainer('assets/images/icons/search.png');
  static starIcon() => _iconContainer('assets/images/icons/Star.png');
  static arrowRightIcon() => _iconContainer(
        'assets/images/icons/arrow-right.png',
        width: _size,
        height: _size,
      );
  static arrowDownIcon() => _iconContainer(
        'assets/images/icons/arrow-down.png',
        width: _size,
        height: _size,
      );
  static Widget editIcon() => _iconContainer(
        'assets/images/icons/edit.png',
        width: _size,
        height: _size,
      );

  static notificationIcon() => _iconContainer(
        'assets/images/icons/notification.png',
        width: _size,
        height: _size,
      );

  static locationIcon() => _iconContainer(
        'assets/images/icons/location.png',
        width: _size,
        height: _size,
      );
  static cartIcon() =>
      _iconContainer('assets/images/icons/bottom_nav/orders-act.png');
}

Image _iconContainer(String path,
        {double width = 16, double height = 16, Color? color}) =>
    Image.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
