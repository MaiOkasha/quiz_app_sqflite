import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/constants/styles.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      title: Text(
        title,
        style: Styles.whiteBold,
      ),
      backgroundColor: AppColors.tealColor,
      centerTitle: true,
    );
  }
}
