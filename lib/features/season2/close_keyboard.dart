import 'package:flutter/material.dart';

class GestureDetector extends StatelessWidget {
  const GestureDetector({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
