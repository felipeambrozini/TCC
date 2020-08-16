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
  AppResponsive _responsive;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _responsive = AppResponsive();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _obscureText = true;
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
        children: [ScrollIcon(), buildTop(), buildBody()],
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
            style: AppFonts.createTitle(),
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
              child: buildInputData(
                  Icons.mail, "Digite seu e-mail", "Email: ", emailController),
            ),
            buildInputPassword(
                Icons.lock,
                _obscureText ? Icons.visibility_off : Icons.visibility,
                "Digite seu senha",
                "Senha: ",
                passwordController),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildInputData(IconData icon, String hintText, String prefixText,
      TextEditingController controller) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            prefixText,
            style: AppFonts.createParagraph(),
          ),
        ),
        Flexible(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            style: AppFonts.createParagraph(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppFonts.createParagraph(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword(IconData prefixicon, IconData sufixicon,
      String hintText, String prefixText, TextEditingController controller) {
    return Row(
      children: [
        Icon(
          prefixicon,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            prefixText,
            style: AppFonts.createParagraph(),
          ),
        ),
        Flexible(
          child: TextField(
            style: AppFonts.createParagraph(),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppFonts.createParagraph(),
            ),
            obscureText: _obscureText,
          ),
        ),
        IconButton(
          icon: Icon(
            sufixicon,
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

  Widget buildLoginButton() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: _responsive.getHeight(160.0)),
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
      print('Caught error: $error');
      Flushbar(
        title: 'Erro',
        message: error.toString(),
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
