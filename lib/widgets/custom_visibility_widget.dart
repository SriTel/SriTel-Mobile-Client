import 'package:flutter/material.dart';

class CustomVisibilityWidget extends StatelessWidget {
  final bool visibility;
  final Widget child;

  const CustomVisibilityWidget({ super.key, required this.visibility, required this.child});

  @override
  Widget build(BuildContext context) {
    return visibility ? child : Container();
  }
}