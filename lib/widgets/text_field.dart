import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/colors.dart';


class CustomTextField extends StatelessWidget {
  String label;
  String? hint;
  Icon? prefixIcon;
  TextEditingController? controller;
  FocusNode? focusNode;
  String? Function(String?)? vaildetor;

  CustomTextField(
      {super.key,
      required this.label,
      this.hint,
      this.prefixIcon,
      this.focusNode,
      required this.vaildetor,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: vaildetor,
        focusNode: focusNode,
        minLines: 1,
        maxLines: 3,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            label: Text(
              label,
              style: TextStyle(color: AppColors.grey),
            ),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.tealColor, width: 2.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.tealColor, width: 2.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey))),
      ),
    );
  }
}
