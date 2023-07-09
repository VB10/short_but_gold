import 'package:flutter/material.dart';
import 'package:short_but_gold/features/season2/infinite_load/infinite_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      //
      home: InfiniteView(),
    );
  }
}
