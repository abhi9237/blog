import 'package:custom_image_view/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';
import '../../../../core/theme/color_constant.dart';

class HomeDetailBottomWidget extends StatelessWidget {
  const HomeDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.sizeOf(context).width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alex Hales',
                    style: appStyle(
                      16,
                      fontFamily: FontHelper.natoBold,
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '1k Followers',
                        style: appStyle(
                          12,
                          fontFamily: FontHelper.natoRegular,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 3),
                      Container(
                        height: 12,
                        width: 1,
                        color: ColorConstant.darkColor,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '320 Following',
                        style: appStyle(
                          12,
                          fontFamily: FontHelper.natoRegular,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.darkColor,
                ),
                child: Text(
                  'Follow',
                  style: appStyle(
                    12,
                    fontFamily: FontHelper.natoMedium,
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Green Leaf Market',
            style: appStyle(
              22,
              fontFamily: FontHelper.natoBold,
              color: ColorConstant.blackColor,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 15,
                color: ColorConstant.blackGreyColor,
              ),
              Text(
                'Chandigarh',
                style: appStyle(
                  12,
                  fontFamily: FontHelper.natoRegular,
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.blackGreyColor,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.watch_later_outlined,
                size: 15,
                color: ColorConstant.blackGreyColor,
              ),
              SizedBox(width: 5),
              Text(
                '25 minutes ago',
                style: appStyle(
                  12,
                  fontFamily: FontHelper.natoRegular,
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.blackGreyColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Blog',
                style: appStyle(
                  22,
                  fontFamily: FontHelper.natoBold,
                  color: ColorConstant.blackColor,
                ),
              ),
              Spacer(),
              Icon(Icons.thumb_up, color: ColorConstant.darkColor),
              SizedBox(width: 10),
              Icon(Icons.thumb_down, color: ColorConstant.darkColor),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'A way to advertise/display the popular times in a event/location. This can be helpful for users who either want to go to a location based on the ambience OR those who want to avoid a busy/crowded locationA way to advertise/display the popular times in a event/location. This can be helpful for users who either want to go to a location based on the ambience OR those who want to avoid a busy/crowded locationA way to advertise/display the popular times in a event/location.',
            style: appStyle(
              12,
              fontFamily: FontHelper.natoRegular,
              fontWeight: FontWeight.w400,
              color: ColorConstant.blackGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
