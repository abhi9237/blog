import 'package:blog/config/route_constant/route_constant.dart';
import 'package:blog/core/theme/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';
import '../widgets/what_blog_create_widget.dart';

class UploadBlogSelection extends StatelessWidget {
  const UploadBlogSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                'What kind of blog do you want to create?',
                style: appStyle(24, fontFamily: FontHelper.natoRegular),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 40),
            WhatBlogCreateWidget(
              onTap: () {
                context.push(RouteConstant.uploadBlog);
              },
              title: 'Image Blog',
              subTitle:
                  'Best for articles, tutorials, stories, photo-based posts',
            ),
            SizedBox(height: 40),
            WhatBlogCreateWidget(
              onTap: () {},
              title: 'Video Blog',
              subTitle:
                  'Best for vlogs,  walkthroughs,  reels, or  long videos',
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
