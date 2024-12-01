import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/widget/spacer/vertical_spacer.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';
import 'package:stray_dog_adoption/data/constant/app_string.dart';

class FullscreenError extends StatelessWidget {
  const FullscreenError({
    required this.onPressed, super.key,
    this.title = 'Opps...',
    this.description = AppString.defaultErrorMessage,
  });
  
  final String title;
  final String description;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(AppDimension.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimension.large),
              child: Icon(
                Icons.warning_rounded,
                size: 150,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const VerticalSpacer.normal(),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withAlpha(150),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const VerticalSpacer.normal(),
            Padding(
              padding: const EdgeInsets.only(bottom: AppDimension.large),
              child: Material(
                borderRadius: BorderRadius.circular(AppDimension.small),
                color: Theme.of(context).colorScheme.errorContainer,
                child: ListTile(
                  title: Text(
                    'TRY AGAIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,),
                  ),
                  onTap: onPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
