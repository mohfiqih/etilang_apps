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

  static var _loginUrl = Uri.parse('http://192.168.208.106:5000/api/login');

  static var _registerUrl =
      Uri.parse('http://192.168.208.106:5000/api/register');

  static flutter_login(nomor_plat, nomor_bpkb, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "nomor_plat": nomor_plat,
      "nomor_bpkb": nomor_bpkb,
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json[0] == 'Login Success, Selamat Datang!') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static flutter_register(nomor_plat, nomor_bpkb, pemilik, jenis_kendaraan,
      merk, warna, alamat, email, telp, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "nomor_plat": nomor_plat,
      "nomor_bpkb": nomor_bpkb,
      "pemilik": pemilik,
      "jenis_kendaraan": jenis_kendaraan,
      "merk": merk,
      "warna": warna,
      "alamat": alamat,
      "email": email,
      "telp": telp
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == 'Username Sudah Ada, Cek Ulang!') {
        await EasyLoading.showError(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      } else {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
