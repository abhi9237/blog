import 'package:blog/core/theme/color_constant.dart';
import 'package:custom_image_view/custom_image_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      alignment: Alignment.bottomCenter,
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: ColorConstant.blackColor,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(10),
        //   bottomRight: Radius.circular(10),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImageView(
              height: 50,
              width: 50,
              url:
                  'https://www.webert.it/wp-content/uploads/2016/08/dummy-prod-1.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              'BLOG',
              style: appStyle(
                23,
                fontFamily: FontHelper.natoBold,
                color: ColorConstant.lightPinkColor,
              ),
            ),
          ),

          Icon(Icons.notifications, size: 30, color: ColorConstant.whiteColor),
        ],
      ),
    );
  }
}
