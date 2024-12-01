// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

class FullScreenLoader extends StatelessWidget {
  final bool hasOpacity;
  final String? title;
  const FullScreenLoader({
    super.key,
    this.hasOpacity = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context)
          .colorScheme
          .surface
          .withAlpha(hasOpacity ? 180 : 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimateList(
              interval: 200.ms,
              effects: [ScaleEffect(duration: 500.ms)],
              onPlay: (controller) => controller.repeat(reverse: true),
              children: const [Dot(), Dot(), Dot()],
            ),
          ),
          if (title == null) const SizedBox.shrink() else Padding(
                  padding: const EdgeInsets.only(top: AppDimension.small),
                  child: Text(title!),
                ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    const dotSize = 15.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dotSize),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
