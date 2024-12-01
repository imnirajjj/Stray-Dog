import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';

class VerticalSpacer extends StatelessWidget {

  const VerticalSpacer.extraSmall({
    super.key,
    this.space = AppDimension.extraSmall,
  });

  const VerticalSpacer.mediumSmall({
    super.key,
    this.space = AppDimension.mediumSmall,
  });

  const VerticalSpacer.small({super.key, this.space = AppDimension.small});

  const VerticalSpacer.normal({super.key, this.space = AppDimension.normal});

  const VerticalSpacer.large({super.key, this.space = AppDimension.large});

  const VerticalSpacer.mediumLarge({
    super.key,
    this.space = AppDimension.mediumLarge,
  });

  const VerticalSpacer.extraLarge({
    super.key,
    this.space = AppDimension.extraLarge,
  });

  const VerticalSpacer.custom({required this.space, super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
