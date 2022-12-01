import 'package:flutter/material.dart';
import 'package:etilang_apps/dashboard.dart';
import 'package:etilang_apps/style/colors.dart';
import 'package:etilang_apps/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
      home: Splash(),
      builder: EasyLoading.init(),
    );
  }
}
