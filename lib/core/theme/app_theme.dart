import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppThemeData {
  static final ThemeData _lightThemeBase = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
    ),
  );

  static ChipThemeData? _defaultChipThemeData(ChipThemeData? chipThemeData) =>
      chipThemeData?.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(width: 0.5),
        ),
      );

  static ThemeData lightTheme(ColorScheme? colorScheme) {
    ThemeData? lightDynamicThemeData;
    if (colorScheme != null) {
      lightDynamicThemeData = ThemeData.from(
        useMaterial3: true,
        colorScheme: colorScheme,
      );
    }
    final tempThemeData = lightDynamicThemeData ?? _lightThemeBase;
    return tempThemeData.copyWith(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarContrastEnforced: true,
          statusBarBrightness: Brightness.light,
        ),
      ),
      listTileTheme: tempThemeData.listTileTheme.copyWith(
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: tempThemeData.colorScheme.surfaceContainerHighest,
      //   border: InputBorder.none,
      // ),
      chipTheme: _defaultChipThemeData(tempThemeData.chipTheme),
    );
  }
}
