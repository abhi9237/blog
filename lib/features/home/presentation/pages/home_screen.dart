import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(),
        HomeDataWidget(),
      ],
    );
  }
}
