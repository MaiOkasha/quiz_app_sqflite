import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/constants/styles.dart';

class QuizOptionWidget extends StatelessWidget {
  String option;
  QuizOptionWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.tealColor, width: 1.5),
      ),
      child: Text(
        option,
        style: Styles.blackBold.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
