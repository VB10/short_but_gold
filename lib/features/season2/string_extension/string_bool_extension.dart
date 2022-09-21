import 'package:flutter/cupertino.dart';

extension StringBoolExtension on String {
  bool get isTrue => bool.fromEnvironment(this);
}

class SampleView extends StatelessWidget {
  const SampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('false'.isTrue ? 'ok' : 'nok');
  }
}
