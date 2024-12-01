import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

class AppIconDialog extends StatelessWidget {
  const AppIconDialog({
    super.key,
    this.title,
    this.icon,
    this.content,
    this.actions,
  });
  final String? title;
  final IconData? icon;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon != null
          ? Icon(
              icon,
              size: AppIconSize.mediumSmall,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )
          : null,
      title: title != null
          ? Text(
              title!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
