import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ScrollIcon extends StatelessWidget {
  final Color color;
  final BatResponsive responsive;

  ScrollIcon({@required this.color, @required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: responsive.getHeight(16.0)),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(2.0),
              )),
          width: responsive.getWidth(32.0),
          height: responsive.getHeight(4.0)),
    );
  }
}
