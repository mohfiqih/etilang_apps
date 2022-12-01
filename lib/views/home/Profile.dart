import 'package:flutter/material.dart';
import 'package:etilang_apps/views/auth/welcome.dart';
import 'package:flutter/material.dart';
import 'package:etilang_apps/component/appBarActionItems.dart';
import 'package:etilang_apps/component/barChart.dart';
import 'package:etilang_apps/component/header.dart';
import 'package:etilang_apps/component/historyTable.dart';
import 'package:etilang_apps/component/infoCard.dart';
import 'package:etilang_apps/component/paymentDetailList.dart';
import 'package:etilang_apps/component/sideMenu.dart';
import 'package:etilang_apps/config/responsive.dart';
import 'package:etilang_apps/config/size_config.dart';
import 'package:etilang_apps/style/colors.dart';
import 'package:etilang_apps/style/style.dart';

class Profil extends StatefulWidget {
  const Profil({Key key}) : super(key: key);

  @override
  State<Profil> createState() => _Profil();
}

class _Profil extends State<Profil> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Capstone Project",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Web Developer & Flutter Developer'),
          ),
          ListTile(
            title: Text(
              "About Me",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                'E-Tilang merupakan sebuah sistem yang digunakan sebagai sarana tilang secara elektronik, batasan dari sistem E-Tilang ini adalah sistem akan mendeteksi objek pengendara dengan apakah pengendara tersebut menggunakan helm atau tidak, dan mendeteksi plat putih dari pengendara motor.'),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 205, 5, 18),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
