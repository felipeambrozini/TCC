import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/login.dart';
import 'package:account/account.dart';
import 'pages/splashScreen.dart';
import 'pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(BatPedia());
  });
}

class BatPedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BatPédia',
      home: SplashScreen(),
      color: Colors.yellow,
      theme: ThemeData.dark(),
      routes: {
        WelcomePage.tag: (context) => WelcomePage(),
        LoginPage.tag: (context) => LoginPage(),
        RegisterPage.tag: (context) => RegisterPage(),
        HomePage.tag: (context) => HomePage(),
        BatmanPage.tag: (context) => BatmanPage(),
        AliesPage.tag: (context) => AliesPage(),
        VillainsPage.tag: (context) => VillainsPage(),
        HQsPage.tag: (context) => HQsPage(),
        MoviesPage.tag: (context) => MoviesPage(),
        TVSeriesPage.tag: (context) => TVSeriesPage(),
        GamesPage.tag: (context) => GamesPage(),
        PersonalInformationPage.tag: (context) => PersonalInformationPage(),
        AboutPage.tag: (context) => AboutPage()
      },
    );
  }
}
