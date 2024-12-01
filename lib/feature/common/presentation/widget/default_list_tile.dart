import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile({
    required this.title,
    required this.subtitle,
    this.trailing,
    super.key,
  });
  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }
}
