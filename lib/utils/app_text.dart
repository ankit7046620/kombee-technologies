import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kombee_demo/core/app_theme.dart';

class AppText extends Text {
  AppText({
    super.key,
    required String text,
    Color? color,
    double? fontSize,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) : super(
          text,
          softWrap: true,
          overflow: overflow,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(
            letterSpacing: letterSpacing ?? 0,
            decoration: decoration ?? TextDecoration.none,
            fontSize: fontSize,
            color: color ?? AppColors.blackColor,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: fontFamily ?? GoogleFonts.raleway().fontFamily,
          ),
        );
}
