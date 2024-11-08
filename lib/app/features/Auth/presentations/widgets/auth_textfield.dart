import 'package:flutter/material.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffix;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: bodyBaseTextStyle.copyWith(color: Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: bodyBaseTextStyle.copyWith(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: Colors.white54,
          suffixIcon: suffix),
    );
  }
}
