import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quirckly/app/core/themes/elevated_button_theme.dart';

ThemeData appTheme() {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.interTextTheme(),
      scaffoldBackgroundColor: blackColor,
      elevatedButtonTheme: elevatedButtonTheme());
}
