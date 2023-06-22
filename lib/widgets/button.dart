import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/colors.dart';

class CustomButton extends StatelessWidget {
  String? text;
  double? width;
  double? height;
  Color backColor = AppColors.tealColor;
  double? borderRadius = 20;
  double? fontsize = 20;
  Color colorText = Colors.white;
  bool? isCenter = true;
  VoidCallback? function;
  CustomButton(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      required this.function,
      this.borderRadius,
      this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: .09,
            color: AppColors.tealColor,
            offset: const Offset(2, 0))
      ], borderRadius: BorderRadius.circular(borderRadius ?? 20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: backColor,
        hoverColor: Colors.black,
        onPressed: function,
        child: Align(
          alignment: (isCenter != null && isCenter == true)
              ? Alignment.center
              : Alignment.centerLeft,
          child: Text(
            text ?? '',
            style: TextStyle(
                fontSize: fontsize,
                color: colorText,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
