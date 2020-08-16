import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter/services.dart';
import 'package:main/pages/welcomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppResponsive responsive = AppResponsive();
    responsive.setWidth(MediaQuery.of(context).size.width);
    double totalHeight = MediaQuery.of(context).size.height;
    double statusBarSize = MediaQuery.of(context).padding.top;
    double actionBarSize = MediaQuery.of(context).padding.bottom;
    responsive.setStatusBarSize(statusBarSize);
    responsive.setActionBarSize(actionBarSize);
    responsive.setHeight(totalHeight);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushNamed(context, WelcomePage.tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildLogo(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Center(child: Image.asset("assets/images/batmanLogo.png"));
  }
}
