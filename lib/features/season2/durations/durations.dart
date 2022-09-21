import 'package:flutter/material.dart';

enum Durations {
  low(Duration(milliseconds: 500)),
  normal(Duration(seconds: 1)),
  high(Duration(seconds: 3));

  final Duration value;

  const Durations(this.value);
}

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Durations.normal.value),
      builder: (BuildContext context, AsyncSnapshot snapshot) => const SizedBox(),
    );
  }
}
