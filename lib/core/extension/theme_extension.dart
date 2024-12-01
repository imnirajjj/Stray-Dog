import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

extension ThemeExtension on ThemeData {
  ThemeData getDefaultStyle() {
    return copyWith(
      dialogTheme: dialogTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.small),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: bottomSheetTheme.copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimension.small),
            topRight: Radius.circular(AppDimension.small),
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  Color get getDefaultSurfaceContainerColor {
    if (brightness == Brightness.dark) {
      return colorScheme.surfaceContainerHigh;
    } else {
      return colorScheme.surfaceContainer;
    }
  }
}
