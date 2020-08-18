import 'package:common/common.dart';
import 'package:flutter/material.dart';

class BatButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isRounded;

  const BatButton(
      {Key key, @required this.text, @required this.onPressed, this.isRounded})
      : super(key: key);

  @override
  _BatButtonState createState() => _BatButtonState();
}

class _BatButtonState extends State<BatButton> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                widget.isRounded == null || !widget.isRounded ? 15.0 : 30.0)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        colorBrightness: Brightness.dark,
        color: Colors.yellow,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(20.0)),
          child: Text(widget.text,
              textAlign: TextAlign.center,
              style: BatFonts.createButton(color: Colors.black)),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
