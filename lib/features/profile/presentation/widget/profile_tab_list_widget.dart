import 'package:flutter/material.dart';

import '../../../../core/theme/color_constant.dart';

class ProfileTabListWidget extends StatelessWidget {
  const ProfileTabListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          SizedBox(height: 15),
          ProfileTabWidget(
            icon: Icons.person_outline,
            text: 'Profile',
          ),
          SizedBox(height: 15),
          ProfileTabWidget(
            icon: Icons.person_outline,
            text: 'Profile',
          ),
          SizedBox(height: 15),
          ProfileTabWidget(
            icon: Icons.person_outline,
            text: 'Profile',

          ),
          SizedBox(height: 15),
          ProfileTabWidget(
            icon: Icons.person_outline,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfileTabWidget extends StatelessWidget {
  final IconData? icon;
  final String?  text;
  const ProfileTabWidget({super.key,
  required this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon,  color: ColorConstant.blackGreyColor,),
          SizedBox(width: 10,),
          Text(
           text ??'',
            style: TextStyle(
              color: ColorConstant.blackGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
