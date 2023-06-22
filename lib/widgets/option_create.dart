import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  Option(
      {required this.option,
      required this.color,
      required this.textColor,
      super.key});
  String option;
  Color color;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 100, bottom: 19),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Text(
        option,
        style: TextStyle(color: textColor, fontSize: 13),
      ),
    );
  }
}
