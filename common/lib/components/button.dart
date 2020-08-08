import 'package:flutter/material.dart';
import 'package:common/common.dart';

class BatButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final bool isRounded;

  BatButton(
      {@required this.text,
      @required this.onPressed,
      this.isRounded,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                isRounded == null || !isRounded ? 15.0 : 30.0)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        colorBrightness: Brightness.dark,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(text,
              textAlign: TextAlign.center,
              style: AppFonts.createButton(
                  fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
