import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pfa/pages/Signup.dart';
import 'package:pfa/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff4d79ff),
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              "assets/logo.png",
              height: 100,
              width: 100,
            )),
          ],
        ));
  }
}
