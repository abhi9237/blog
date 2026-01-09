import 'package:blog/core/theme/color_constant.dart';
import 'package:flutter/cupertino.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const CommonButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [ColorConstant.lightPinkColor, ColorConstant.pinkColor],
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
