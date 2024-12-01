// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum ElevatedButtonType { primary, secondary, error }

class AppElevatedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final IconData? icon;
  final bool isLoading;
  final ElevatedButtonType elevatedButtonType;

  const AppElevatedButton.primary({
    required this.title, super.key,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.elevatedButtonType = ElevatedButtonType.primary,
  });

  const AppElevatedButton.secondary({
    required this.title, super.key,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.elevatedButtonType = ElevatedButtonType.secondary,
  });

  const AppElevatedButton.error({
    required this.title, super.key,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.elevatedButtonType = ElevatedButtonType.error,
  });

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color foregroundColor;
    if (elevatedButtonType == ElevatedButtonType.primary) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      foregroundColor = Theme.of(context).colorScheme.onPrimary;
    } else if (elevatedButtonType == ElevatedButtonType.secondary) {
      backgroundColor = Theme.of(context).colorScheme.secondary;
      foregroundColor = Theme.of(context).colorScheme.onSecondary;
    } else {
      backgroundColor = Theme.of(context).colorScheme.error;
      foregroundColor = Theme.of(context).colorScheme.onError;
    }
    if (icon != null || isLoading) {
      return ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            // ? CircularProgressIndicator(
            //     color: foregroundColor,
            //   )
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor,
                ),
              )
            : Icon(
                icon,
                color: foregroundColor,
              ),
        label: Text(
          title,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      );
    }
  }
}
