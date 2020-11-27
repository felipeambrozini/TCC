import 'package:flutter/material.dart';
import 'package:common/common.dart';

class BatFonts {
  BatFonts();

  static const String FONT_FAMILY = 'ProximaNova';
  static const String FONT_FAMILY_BOLD = 'ProximaNovaBold';
  static const double TITLE_HEIGHT = 1.0;
  static const double PARAGRAPH_HEIGHT = 1.0;
  static const double LETTERSPACING = 0.0;

  //Title
  static double t1 = 22.0;
  static double t2 = 20.0;
  static double t3 = 18.0;

  //Paragraph
  static double p1 = 16.0;
  static double p2 = 14.0;
  static double p3 = 12.0;

  static TextStyle createTitle(
          {String fontFamily = FONT_FAMILY_BOLD,
          double fontSize,
          Color color = Colors.yellow,
          double height: TITLE_HEIGHT,
          double letterSpacing: LETTERSPACING,
          TextDecoration decoration: TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? t1,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle createParagraph(
          {String fontFamily = FONT_FAMILY,
          double fontSize,
          Color color = Colors.yellow,
          double height: PARAGRAPH_HEIGHT,
          double letterSpacing: LETTERSPACING,
          TextDecoration decoration: TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? p1,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontWeight: FontWeight.w600
      );

  static void setResponsive() {
    BatResponsive responsive = BatResponsive();

    t1 = responsive.getWidth(t1);
    t2 = responsive.getWidth(t2);
    t3 = responsive.getWidth(t3);

    p1 = responsive.getWidth(p1);
    p2 = responsive.getWidth(p2);
    p3 = responsive.getWidth(p3);
  }
}
