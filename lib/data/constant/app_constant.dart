import 'package:flutter/animation.dart';

abstract class AppDimension {
  static const double extraSmall = 5;
  static const double small = 10;
  static const double mediumSmall = 15;
  static const double normal = 20;
  static const double mediumLarge = 30;
  static const double large = 40;
  static const double extraLarge = 60;

  //
  static const double defaultBottomNavigationGap = 200;
}

abstract class AppBorderRadius {
  static const double extraSmall = 5;
  static const double small = 10;
  static const double normal = 20;
  static const double large = 30;
  static const double extraLarge = 50;
}

abstract class AppIconSize {
  static const double small = 18;
  static const double normal = 24;
  static const double mediumSmall = 32;
  static const double medium = 48;
  static const double large = 64;
  static const double extraLarge = 96;
}

abstract class AppDuration {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration extraSlow = Duration(milliseconds: 1000);

  /// flushbar
  static const Duration toaster = Duration(seconds: 3);

  /// splash screen
  static const Duration splashScreen = Duration(milliseconds: 2000);
}

abstract class AppCurve {
  static const Curve normal = Curves.easeIn;
}

abstract class AppDefault {
  static const String language = 'en';
  static const int themeIndex = 0;
}
