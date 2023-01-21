import 'package:etilang_apps/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:etilang_apps/views/auth/login.dart';
import 'package:etilang_apps/views/auth/register.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:etilang_apps/constant.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5036D5),
      // appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome to Simolang Apps",
              style: TextStyle(
                  color: Color.fromARGB(255, 205, 205, 205),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 10,
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    // height: 250,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 231, 255),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:etilang_apps/views/auth/Screens/Welcome/welcome_screen.dart';
// import 'package:etilang_apps/constant.dart';

// void main() => runApp(const Well());

// class Well extends StatelessWidget {
//   const Well({Key key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//           primaryColor: kPrimaryColor,
//           scaffoldBackgroundColor: Colors.white,
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               elevation: 0,
//               primary: kPrimaryColor,
//               shape: const StadiumBorder(),
//               maximumSize: const Size(double.infinity, 56),
//               minimumSize: const Size(double.infinity, 56),
//             ),
//           ),
//           inputDecorationTheme: const InputDecorationTheme(
//             filled: true,
//             fillColor: kPrimaryLightColor,
//             iconColor: kPrimaryColor,
//             prefixIconColor: kPrimaryColor,
//             contentPadding: EdgeInsets.symmetric(
//                 horizontal: defaultPadding, vertical: defaultPadding),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(30)),
//               borderSide: BorderSide.none,
//             ),
//           )),
//       home: const WelcomeScreen(),
//     );
//   }
// }
