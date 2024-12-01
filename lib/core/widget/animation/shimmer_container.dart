// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerContainer extends StatelessWidget {
  final Widget child;
  const ShimmerContainer({
    required this.child, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [ShimmerEffect(duration: 2.seconds)],
      onPlay: (controller) => controller.repeat(),
      child: child,
    );
  }
}
