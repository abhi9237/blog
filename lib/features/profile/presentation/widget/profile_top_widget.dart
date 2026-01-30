import 'package:blog/core/theme/color_constant.dart';
import 'package:custom_image_view/custom_image_view.dart';
import 'package:flutter/material.dart';

class ProfileTopWidget extends StatelessWidget {
  const ProfileTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConstant.lightPinkColor, ColorConstant.pinkColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImageView(
              height: 100,
              width: 100,
              url:
                  'https://www.webert.it/wp-content/uploads/2016/08/dummy-prod-1.jpg',
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'Jhon Due',
            style: TextStyle(
              color: ColorConstant.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'jhondue@gmail.com',
            style: TextStyle(
              color: ColorConstant.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
