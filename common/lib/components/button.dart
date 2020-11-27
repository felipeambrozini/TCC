import 'package:common/common.dart';
import 'package:flutter/material.dart';

class BatButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;
  final BatResponsive responsive;

  const BatButton(
      {@required this.text,
      @required this.onPressed,
      @required this.buttonColor,
      @required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.getWidth(16.0)),
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        colorBrightness: Brightness.dark,
        color: buttonColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: responsive.getHeight(20.0)),
          child: Text(text,
              textAlign: TextAlign.center,
              style: BatFonts.createTitle(
                  color: buttonColor == Colors.yellow
                      ? Colors.black
                      : Colors.yellow,
                  fontSize: BatFonts.t2)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
