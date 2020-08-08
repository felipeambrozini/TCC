import 'package:flutter/material.dart';

class BatAppBar extends StatelessWidget implements PreferredSizeWidget {
  BatAppBar({@required this.blackFont, @required this.color});
  final bool blackFont;
  final Color color;
  final Size preferredSize = Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: color,
        elevation: 0.0,
        brightness: blackFont ? Brightness.light : Brightness.dark);
  }
}
