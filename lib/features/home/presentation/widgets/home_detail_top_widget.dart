import 'package:custom_image_view/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';
import '../../../../core/theme/color_constant.dart';

class HomeDetailTopWidget extends StatelessWidget {
  const HomeDetailTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageView(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: MediaQuery.sizeOf(context).width,
          url:
          'https://images.ft.com/v3/image/raw/ftcms%3A97c7b89e-8743-49bc-82bc-38475aad028b?source=next-article&fit=scale-down&quality=highest&width=1440&dpr=1',
        ),
        Container(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.35, 0.7, 1.5],
              colors: [
                ColorConstant.darkColor.withValues(alpha: 0.1),
                ColorConstant.darkColor.withValues(alpha: 0.3),
                ColorConstant.darkColor.withValues(alpha: 0.5),
                ColorConstant.whiteColor.withValues(alpha: 0.4),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      context.pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorConstant.whiteColor,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: ColorConstant.darkColor,
                        size: 22,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorConstant.whiteColor,
                    ),
                    child: Icon(
                      Icons.bookmark_border,
                      color: ColorConstant.darkColor,
                      size: 22,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(3, (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor.withValues(
                          alpha: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorConstant.whiteColor.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      child: Text(
                        '#Fresh Market',
                        style: appStyle(
                          8,
                          fontFamily: FontHelper.natoBold,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
