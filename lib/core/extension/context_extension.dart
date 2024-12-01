import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {  
  void showSnackbar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(text),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
