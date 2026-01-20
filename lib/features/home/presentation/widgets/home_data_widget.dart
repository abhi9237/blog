import 'package:blog/config/route_constant/route_constant.dart';
import 'package:blog/core/extension/app_extension.dart';
import 'package:blog/core/theme/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/app_font.dart';

class HomeDataWidget extends StatelessWidget {
  const HomeDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return HomeData(
            onTap: () {
              context.push(RouteConstant.homeDetail);
            },
          );
        },
      ),
    );
  }
}

class HomeData extends StatelessWidget {
  final VoidCallback onTap;
  const HomeData({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),

        height: 170,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              'https://images.goodreturns.in/img/2025/03/us-stock-markets-1742223553.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          children: [
            Container(
              height: 170,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorConstant.darkColor.withValues(alpha: 0.7),
                    ColorConstant.darkColor.withValues(alpha: 0.2),
                    ColorConstant.darkColor.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorConstant.whiteColor,
                ),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: ColorConstant.blackColor,
                  size: 22,
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Fresh Market',
                    style: appStyle(18, fontFamily: FontHelper.natoBold),
                  ),

                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 14),
                      Text(
                        'Chandigarh',
                        style: appStyle(
                          12,
                          fontFamily: FontHelper.natoRegular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.watch_later_outlined, size: 14),
                      SizedBox(width: 5),
                      Text(
                        '25 minutes ago',
                        style: appStyle(
                          12,
                          fontFamily: FontHelper.natoRegular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
