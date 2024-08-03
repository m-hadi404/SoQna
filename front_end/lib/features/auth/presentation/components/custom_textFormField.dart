import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:front_end/core/utils/colors.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextFormField({
    required this.title,
    required this.hintText,
    required this.validatorFn,
    this.keyboardType,
    this.obscureText = false,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontSize: 14.sp,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 18.sp,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validatorFn,
          controller:controller,
        ),
      ],
    );
  }
}
