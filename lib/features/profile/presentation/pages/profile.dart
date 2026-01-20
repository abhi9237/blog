import 'package:flutter/material.dart';

import '../widget/profile_tab_list_widget.dart';
import '../widget/profile_top_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [ProfileTopWidget(), ProfileTabListWidget()]),
      ),
    );
  }
}
