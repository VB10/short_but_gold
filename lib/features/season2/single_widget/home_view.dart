import 'package:flutter/material.dart';

part 'module/home_appbar.dart';
part 'module/home_body.dart';
part 'module/home_bottom_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _HomeAppBar(),
      body: _HomeBody(),
      bottomNavigationBar: _HomeBottomBar(),
    );
  }
}
