import 'package:dsc_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LogIn(),
      image: new Image.asset(
        "images/MainLogo.png",
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
      photoSize: 100,
    );
  }
}
