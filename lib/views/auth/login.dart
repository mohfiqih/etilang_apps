import 'package:etilang_apps/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:etilang_apps/service/http_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:etilang_apps/constant.dart';
import 'package:etilang_apps/component/already_have_an_account_acheck.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  String nomor_plat;
  String nomor_bpkb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 56, 2, 149),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                    flex: 10,
                    child: SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: 250,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 50),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Masukan Nomor Plat Anda',
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
              TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Masukan Nomor BPKB Anda',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.vpn_key),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nomor_bpkb = value;
                  });
                },
              ),

              InkWell(
                onTap: () async {
                  print("Nomor Plat : " + nomor_plat);
                  print("Nomor BPKB : " + nomor_bpkb);

                  await HttpService.flutter_login(
                      nomor_plat, nomor_bpkb, context);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: const Center(
                    child: Text(
                      "Login",
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
              // const SizedBox(height: 5),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
