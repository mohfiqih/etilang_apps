import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:etilang_apps/views/auth/welcome.dart';
// import 'package:portfolio_mohfiqih/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:etilang_apps/onboarding.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return OnboardingScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5036D5),
      body: Center(
        child: Center(
          child: Image(
            image: AssetImage('assets/images/splash.png'),
            height: 150.0,
            width: 150.0,
          ),
          // child: Icon(
          //   Icons.bike_scooter_outlined,

          //   color: Colors.white,
          //   size: 70,
          // ),
        ),
      ),
    );
  }
}
