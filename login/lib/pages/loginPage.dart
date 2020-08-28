import 'package:common/common.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:account/account.dart';

class LoginPage extends StatefulWidget {
  static const String tag = '/login/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BatResponsive _responsive;
  BatValidations _validations;
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  bool _obscureText;
  bool _erroMsgE;
  bool _erroMsgP;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _validations = BatValidations();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    _obscureText = true;
    _erroMsgE = false;
    _erroMsgP = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildLoginPage(),
    );
  }

  Widget buildLoginPage() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _responsive.getWidth(16.0),
      ),
      child: Column(
        children: [
          ScrollIcon(
            color: Colors.yellow,
          ),
          buildTop(),
          buildBody()
        ],
      ),
    );
  }

  Widget buildTop() {
    return Padding(
      padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Login',
            style: BatFonts.createTitle(),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.transparent,
              child: Icon(
                Icons.close,
                color: Colors.yellow,
                size: _responsive.getWidth(32.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: _responsive.getHeight(64.0)),
              child: buildInputEmail(),
            ),
            _erroMsgE ? buildErrorMessage("E-mail inválido") : Container(),
            Padding(
              padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
              child: buildInputPassword(),
            ),
            _erroMsgP ? buildErrorMessage("Senha inválido") : Container(),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildInputEmail() {
    return Row(
      children: [
        Icon(
          Icons.mail,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            "Email: ",
            style: BatFonts.createTitle(),
          ),
        ),
        Flexible(
          child: TextField(
            autofocus: true,
            cursorColor: Colors.yellow,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            style: BatFonts.createParagraph(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Digite seu e-mail",
              hintStyle: BatFonts.createParagraph(),
            ),
            focusNode: emailFocusNode,
            onEditingComplete: () {
              _validations.validateEmail(emailController.text)
                  ? FocusScope.of(context).requestFocus(passwordFocusNode)
                  : setState(() {
                      _erroMsgE = true;
                    });
            },
            onChanged: (text) {
              setState(() {
                _erroMsgE = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword() {
    return Row(
      children: [
        Icon(
          Icons.lock,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            "Senha: ",
            style: BatFonts.createTitle(),
          ),
        ),
        Flexible(
          child: TextField(
            cursorColor: Colors.yellow,
            style: BatFonts.createParagraph(),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Digite seu senha",
              hintStyle: BatFonts.createParagraph(),
            ),
            obscureText: _obscureText,
            focusNode: passwordFocusNode,
            onEditingComplete: () {
              _validations.validatePassword(passwordController.text)
                  ? FocusScope.of(context).unfocus()
                  : setState(() {
                      _erroMsgP = true;
                    });
            },
            onChanged: (text) {
              setState(() {
                _erroMsgP = false;
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.yellow,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ],
    );
  }

  Widget buildErrorMessage(String errorMsg) => Padding(
        padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(16.0)),
        child: Text(
          errorMsg,
          style: BatFonts.createParagraph(
            color: Colors.red,
          ),
        ),
      );

  Widget buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(160.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(text: "Realizar login", onPressed: _signIn),
          )
        ],
      ),
    );
  }

  Future<void> _signIn() async {
    final email = emailController.text;
    final password = passwordController.text;
    await Auth.signIn(email, password)
        .then(_onSignInSuccess)
        .catchError((error) {
      Flushbar(
        titleText: Text(
          'Erro',
          style: BatFonts.createTitle(color: Colors.black),
        ),
        messageText: Text(
          error.toString(),
          style: BatFonts.createParagraph(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  Future _onSignInSuccess(String userId) async {
    final user = await Auth.getUser(userId);
    await Auth.storeUserLocal(user);
    Navigator.pushNamed(context, HomePage.tag);
  }
}
