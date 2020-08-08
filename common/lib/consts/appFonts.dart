import 'package:flutter/material.dart';
import 'package:common/common.dart';

class AppFonts {
  AppFonts();

  static const String FONT_FAMILY = 'ProximaNova';
  static const double TITLE_HEIGHT = 1.0;
  static const double PARAGRAPH_HEIGHT = 1.0;
  static const double BUTTON_HEIGHT = 1.0;
  static const double LETTERSPACING = 0.0;

  //Title
  static double h1 = 20.0;
  static double h2 = 18.0;
  static double h3 = 16.0;

  //Paragraph
  static double p1 = 16.0;
  static double p2 = 14.0;
  static double p3 = 12.0;

  //Button
  static double b1 = 16.0;
  static double b2 = 14.0;
  static double b3 = 12.0;

  static TextStyle createTitle(
          {String fontFamily = FONT_FAMILY,
          double fontSize,
          Color color = Colors.yellow,
          double height: TITLE_HEIGHT,
          FontWeight fontWeight: FontWeight.bold,
          double letterSpacing: LETTERSPACING,
          TextDecoration decoration: TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? h1,
        color: color,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle createParagraph(
          {String fontFamily = FONT_FAMILY,
          double fontSize,
          Color color = Colors.yellow,
          double height: PARAGRAPH_HEIGHT,
          FontWeight fontWeight: FontWeight.w400,
          double letterSpacing: LETTERSPACING,
          TextDecoration decoration: TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? p2,
        color: color,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle createButton(
          {String fontFamily = FONT_FAMILY,
          double fontSize,
          Color color = Colors.yellow,
          double height: BUTTON_HEIGHT,
          FontWeight fontWeight: FontWeight.w400,
          double letterSpacing: LETTERSPACING,
          TextDecoration decoration: TextDecoration.none}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? b1,
        color: color,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static void setResponsive() {
    AppResponsive responsive = AppResponsive();

    h1 = responsive.getWidth(h1);
    h2 = responsive.getWidth(h2);
    h3 = responsive.getWidth(h3);

    p1 = responsive.getWidth(p1);
    p2 = responsive.getWidth(p2);
    p3 = responsive.getWidth(p3);

    b1 = responsive.getWidth(b1);
    b2 = responsive.getWidth(b2);
    b3 = responsive.getWidth(b3);
  }
}