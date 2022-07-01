import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_demo/page/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // child: FlutterLogo(size: MediaQuery.of(context).size.height));
        child: Center(
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
            height: 350,
            width: 320,
          ),
        ));
  }
}
