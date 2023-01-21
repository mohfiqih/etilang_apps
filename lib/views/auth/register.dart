import 'package:etilang_apps/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:etilang_apps/service/http_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:etilang_apps/constant.dart';
import 'package:etilang_apps/component/already_have_an_account_acheck.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String nomor_plat;
  String nomor_bpkb;
  String pemilik;
  String jenis_kendaraan;
  String merk;
  String warna;
  String alamat;
  String email;
  String telp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Color.fromARGB(255, 56, 2, 149),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: 350,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Nomor Plat',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.assignment_outlined),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nomor_plat = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Nomor BPKB',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.key),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nomor_bpkb = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Nama Pemilik',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.location_history_rounded),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    pemilik = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Jenis Kendaraan',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.motorcycle_outlined),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    jenis_kendaraan = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Merk Kendaraan',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.card_membership),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    merk = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Warna Kendaraan',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.color_lens),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    warna = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Alamat Pemilik',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.location_city),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    alamat = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Email Pemilik',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.email),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Telp. Pemilik',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.phone),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    telp = value;
                  });
                },
              ),
              InkWell(
                onTap: () async {
                  print("Nomor Plat : " + nomor_plat);
                  print("Nomor BPKB : " + nomor_bpkb);
                  print("Nama Pemilik : " + pemilik);
                  print("Jenis Kendarann : " + jenis_kendaraan);
                  print("Merk Kendaraan : " + merk);
                  print("Warna Kendaraan : " + warna);
                  print("Alamat Pemilik : " + alamat);
                  print("Email Pemilik : " + email);
                  print("Telp Pemilik : " + telp);
                  await HttpService.flutter_register(
                      nomor_plat,
                      nomor_bpkb,
                      pemilik,
                      jenis_kendaraan,
                      merk,
                      warna,
                      alamat,
                      email,
                      telp,
                      context);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 2, 149),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
