import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

class LoginPage extends StatefulWidget {
  static const String tag = '/login/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppResponsive _responsive;
  LoginService _loginService;
  bool _showErrorMsg = false;
  FocusNode _textFocus;
  FocusNode _defocus;

  bool _isPasswordField() {
    return _loginService.step == LoginStep.PASSWORD;
  }

  @override
  void initState() {
    super.initState();
    _responsive = AppResponsive();
    _loginService = LoginService();
    _loginService.step = LoginStep.EMAIL;
    _loginService.setLoginData();
    _textFocus = FocusNode();
    _defocus = FocusNode();
    keyboardFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _textFocus.dispose();
    _defocus.dispose();
  }

  keyboardFocus() {
    setState(() {
      Future.delayed(Duration(milliseconds: 300),
          () => FocusScope.of(context).requestFocus(_textFocus));
    });
  }

  bool validate(String text) {
    switch (_loginService.step) {
      case LoginStep.EMAIL:
        return Validations().validateEmail(text);
        break;
      case LoginStep.PASSWORD:
        return text == '123456';
        break;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BatInputField>(
        stream: _loginService.streamData,
        builder: (BuildContext context, AsyncSnapshot<BatInputField> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildBody(snapshot.data),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: buildBottom(_isPasswordField()
                      ? PasswordService().password.text
                      : snapshot.data.controller.text),
                ),
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green)));
          }
        });
  }

  Widget buildBody(BatInputField dataField) => Padding(
        padding: EdgeInsets.only(
          top: _responsive.getHeight(16.0),
          right: _responsive.getWidth(16.0),
          left: _responsive.getWidth(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: _responsive.getHeight(18.5)),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      )),
                  width: _responsive.getWidth(34.0),
                  height: _responsive.getHeight(4.0),
                ),
              ),
            ),
            buildTop(),
            Padding(
              padding: EdgeInsets.only(top: _responsive.getHeight(100.0)),
              child: buildInputField(dataField),
            ),
          ],
        ),
      );

  Widget buildTop() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Login',
            style: AppFonts.createParagraph(
              fontSize: AppFonts.p1,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: _responsive.getWidth(20.0)),
              child: Icon(
                Icons.close,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      );

  Widget buildInputField(BatInputField dataField) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildLabel(dataField.label),
          _isPasswordField() ? buildDilettaPassword() : Container(),
          buildTextField(dataField),
          _showErrorMsg ? buildErrorMessage(dataField.errorMsg) : Container()
        ],
      );

  Widget buildLabel(String label) => Padding(
        padding: EdgeInsets.only(bottom: _responsive.getHeight(30.0)),
        child: Text(
          label,
          style: AppFonts.createTitle(
            color: Colors.yellow,
            fontSize: _responsive.getWidth(24.0),
          ),
        ),
      );

  Widget buildTextField(BatInputField dataField) => SizedBox(
        height: _isPasswordField() ? 0.0 : null,
        child: Opacity(
            opacity: _isPasswordField() ? 0.0 : 1.0,
            child: TextField(
              controller: _isPasswordField()
                  ? PasswordService().password
                  : dataField.controller,
              keyboardType: dataField.keyboardType,
              autofocus: true,
              focusNode: _textFocus,
              style: AppFonts.createParagraph(
                fontSize: _responsive.getWidth(24.0),
                color: Colors.yellow,
              ),
              onChanged: (text) {
                setState(() {
                  _showErrorMsg = false;
                  if (_isPasswordField() && text.length == 6) {
                    if (validate(text)) {
                      _loginService.email = null;
                      // Navigator.pushNamed(context, HomePage.tag);
                    } else
                      _showErrorMsg = true;
                  }
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: dataField.hintText,
                hintStyle: AppFonts.createParagraph(
                  fontWeight: FontWeight.w300,
                  fontSize: _responsive.getWidth(24.0),
                  color: Colors.yellow,
                ),
              ),
            )),
      );

  Widget buildDilettaPassword() => GestureDetector(
        onTap: () {
          if (MediaQuery.of(context).viewInsets.bottom <= 0) {
            FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(_textFocus);
          }
        },
        child: Container(
          color: Colors.transparent,
          child: BatPassword(
            onlyNumbers: true,
            size: 6,
            color: Colors.yellow,
          ),
        ),
      );

  Widget buildErrorMessage(String errorMsg) => Padding(
        padding: EdgeInsets.only(top: _responsive.getHeight(15.0)),
        child: Text(
          errorMsg,
          style: AppFonts.createParagraph(
            color: Colors.red,
          ),
        ),
      );

  Widget buildBottom(String text) => FlatButton(
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
        splashColor: Colors.yellow.withOpacity(0.3),
        colorBrightness: Brightness.dark,
        onPressed: () {
          FocusScope.of(context).requestFocus(_defocus);
          if (_isPasswordField()) {
            _showErrorMsg = false;
            _loginService.step = LoginStep.EMAIL;
            _loginService.setLoginData();
            keyboardFocus();
          } else {
            if (validate(text)) {
              FocusScope.of(context).requestFocus(_defocus);
              _loginService.email = text;
              _loginService.step = LoginStep.PASSWORD;
              _loginService.setLoginData();
              keyboardFocus();
            } else {
              setState(() {
                _showErrorMsg = true;
              });
            }
          }
        },
        child: Row(
          mainAxisAlignment: _isPasswordField()
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: <Widget>[
            _isPasswordField()
                ? Padding(
                    padding: EdgeInsets.only(left: _responsive.getWidth(5.0)),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: _responsive.getWidth(16.0),
                    ),
                  )
                : Container(),
            _isPasswordField()
                ? Container()
                : Text(
                    'Próximo',
                    style: AppFonts.createParagraph(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
            _isPasswordField()
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(left: _responsive.getWidth(5.0)),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: _responsive.getWidth(16.0),
                    ),
                  )
          ],
        ),
      );
}
