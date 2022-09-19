import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

extension CustomPageSheet on CustomPage {
  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) => this);
  }
}
