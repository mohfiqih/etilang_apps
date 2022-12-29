import 'dart:convert';
import 'dart:io';

import 'package:etilang_apps/views/auth/login.dart';
import 'package:etilang_apps/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:etilang_apps/dashboard.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://192.168.220.106:5000/api/login');

  static var _registerUrl =
      Uri.parse('http://192.168.220.106:5000/api/register');

  static flutter_login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json[0] == 'Login Success') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        EasyLoading.showSuccess(json[0]);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static flutter_register(username, email, password, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "username": username,
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == 'Username Already Exist') {
        await EasyLoading.showError(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      } else {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
