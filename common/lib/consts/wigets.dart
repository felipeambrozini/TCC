import 'package:flutter/material.dart';
import 'package:common/common.dart';

class BatWidgets {
  static BatWidgets _instance;
  BatResponsive _responsive;

  factory BatWidgets() {
    _instance ??= BatWidgets._internal();
    return _instance;
  }

  BatWidgets._internal() {
    _responsive = BatResponsive();
  }

  Widget snackBar({
    @required String label,
  }) {
    return SnackBar(
      backgroundColor: Colors.yellow,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(7.0)),
        child: Text(
          label,
          style: BatFonts.createParagraph(color: Colors.black),
        ),
      ),
      duration: Duration(seconds: 2),
    );
  }

  Widget bottomBar({
    @required BuildContext context,
    Function onPressed,
    String label = 'Próximo',
  }) =>
      MediaQuery.of(context).viewInsets.bottom > 0
          ? FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_responsive.getWidth(20.0)),
                  topRight: Radius.circular(_responsive.getWidth(20.0)),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: _responsive.getHeight(20.0),
                horizontal: _responsive.getWidth(20.0),
              ),
              color: Colors.yellow,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashColor: Colors.yellow,
              colorBrightness: Brightness.dark,
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    label,
                    style: BatFonts.createTitle(
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _responsive.getWidth(5.0)),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: _responsive.getWidth(16.0),
                    ),
                  )
                ],
              ),
            )
          : GestureDetector(
              onTap: onPressed,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: _responsive.getHeight(40.0),
                  horizontal: _responsive.getWidth(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      label,
                      style: BatFonts.createTitle(
                        color: Colors.yellow,
                        height: 1.2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _responsive.getWidth(5.0)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.yellow,
                        size: _responsive.getWidth(16.0),
                      ),
                    )
                  ],
                ),
              ),
            );
}
