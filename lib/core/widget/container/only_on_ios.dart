import 'dart:io';

import 'package:flutter/material.dart';

class OnlyOnIos extends StatelessWidget {
  const OnlyOnIos({
    required this.child, super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? child : const SizedBox.shrink();
  }
}
