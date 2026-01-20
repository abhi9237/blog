import 'package:blog/core/common/common_button.dart';
import 'package:blog/features/home/presentation/widgets/home_detail_bottom_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/color_constant.dart';
import '../widgets/home_detail_top_widget.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: CommonButton(buttonText: 'Message'),
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [HomeDetailTopWidget(), HomeDetailBottomWidget()],
        ),
      ),
    );
  }
}
