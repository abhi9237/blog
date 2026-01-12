import 'package:custom_image_view/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/image_constant/image_constant.dart';
import '../../../../core/theme/color_constant.dart';

class UploadBlogCoverPhotoWidget extends StatelessWidget {
  const UploadBlogCoverPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 210,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 190,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.uploadImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.lightPinkColor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
