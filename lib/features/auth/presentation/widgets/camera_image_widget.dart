import 'dart:io';

import 'package:blog/core/theme/color_constant.dart';
import 'package:flutter/material.dart';

class CameraImageWidget extends StatelessWidget {
  final VoidCallback onTapCamera;
  final File? image;
  const CameraImageWidget({
    super.key,
    required this.onTapCamera,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCamera,
      child: Stack(
        children: [
          image == null
              ? Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Icon(
              Icons.camera_alt_outlined,
              color: ColorConstant.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
