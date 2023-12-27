import 'package:flutter/material.dart';

import '../../../../core/constants/app/color_strings.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    super.key,
    required this.controller,
    required this.iconData,
    required this.labelText,
    this.suffixIcon,
    required this.obscureText,
  });

  final TextEditingController controller;
  final IconData iconData;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF273C66),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.appBarColor,
              style: BorderStyle.solid,
              width: 2.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          labelText: labelText,
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
