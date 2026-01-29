import 'package:blog/core/theme/color_constant.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/app_font.dart';
import '../../../../core/extension/app_extension.dart';

class BlogVisibilityWidget extends StatelessWidget {
  final bool? isVisible;
  final Function(bool)? onChange;
  const BlogVisibilityWidget({super.key, this.isVisible, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          (isVisible ?? false) ? 'Public' : 'Private',
          style: appStyle(
            fontWeight: FontWeight.w400,
            16,
            fontFamily: FontHelper.natoMedium,
          ),
        ),
        CupertinoSwitch(
          value: isVisible ?? false,
          activeTrackColor: ColorConstant.lightPinkColor,
          onChanged: onChange,
        ),
      ],
    );
  }
}
