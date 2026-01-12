import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';
import '../../../../core/theme/color_constant.dart';

class WhatBlogCreateWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const WhatBlogCreateWidget({super.key, required this.title, required this.subTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: ColorConstant.lightPinkColor)),
        child:Column(
          children: [
            Text(
              title,
              style: appStyle(22, fontFamily: FontHelper.natoRegular,color: ColorConstant.whiteColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5,),
            Text(
              subTitle,
              style: appStyle(12, fontFamily: FontHelper.natoRegular,fontWeight: FontWeight.w300,color: ColorConstant.whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ) ,
      ),
    );
  }
}
