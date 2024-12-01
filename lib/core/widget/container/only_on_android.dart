import 'dart:io';

import 'package:flutter/material.dart';

class OnlyOnAndroid extends StatelessWidget {
  const OnlyOnAndroid({
    required this.child, super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? child : const SizedBox.shrink();
  }
}
