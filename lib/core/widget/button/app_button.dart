// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

enum ButtonType { primary, secondary, error }

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final ButtonType buttonType;

  const AppButton.primary({
    required this.text,
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.buttonType = ButtonType.primary,
  });

  const AppButton.secondary({
    required this.text,
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.buttonType = ButtonType.secondary,
  });

  const AppButton.error({
    required this.text,
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.buttonType = ButtonType.error,
  });

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color foregroundColor;
    if (buttonType == ButtonType.primary) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      foregroundColor = Theme.of(context).colorScheme.onPrimary;
    } else if (buttonType == ButtonType.secondary) {
      backgroundColor = Theme.of(context).colorScheme.secondary;
      foregroundColor = Theme.of(context).colorScheme.onSecondary;
    } else {
      backgroundColor = Theme.of(context).colorScheme.error;
      foregroundColor = Theme.of(context).colorScheme.onError;
    }
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppDimension.small),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: isLoading ? null : onPressed,
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
