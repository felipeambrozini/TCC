import 'package:flutter/material.dart';

class BatTheme {
  static final ThemeData batTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.yellow,
        secondary: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.yellow,
      ),
      fontFamily: 'ProximaNova',
      dividerColor: Colors.yellow,
      errorColor: Colors.red,
      splashColor: Colors.yellow,
      accentColor: Colors.yellow,
      brightness: Brightness.dark,
      cursorColor: Colors.black);
}
