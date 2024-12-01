import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

class HorizontalSpacer extends StatelessWidget {

  const HorizontalSpacer.extraSmall({
    super.key,
    this.space = AppDimension.extraSmall,
  });

  const HorizontalSpacer.mediumSmall({
    super.key,
    this.space = AppDimension.mediumSmall,
  });

  const HorizontalSpacer.small({super.key, this.space = AppDimension.small});

  const HorizontalSpacer.normal({super.key, this.space = AppDimension.normal});

  const HorizontalSpacer.large({super.key, this.space = AppDimension.large});

  const HorizontalSpacer.mediumLarge({
    super.key,
    this.space = AppDimension.mediumLarge,
  });

  const HorizontalSpacer.extraLarge({
    super.key,
    this.space = AppDimension.extraLarge,
  });

  const HorizontalSpacer.custom({required this.space, super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
