import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/styles.dart';
import 'package:quiz_uni/widgets/text_field.dart';

class AddOption extends StatelessWidget {
  String title;
  String textFieldTitle;
  Color containerBackColor;
  TextEditingController controller;
  AddOption(
      {Key? key,
      required this.title,
      required this.textFieldTitle,
      required this.containerBackColor,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: containerBackColor,
          radius: 25,
          child: Text(
            title,
            style: Styles.whiteBold
                .copyWith(fontSize: 30, fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(
          child: CustomTextField(
            controller: controller,
            label: textFieldTitle,
            vaildetor: (p0) {
              if (p0!.isEmpty) {
                return 'Answer Field is Required';
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
