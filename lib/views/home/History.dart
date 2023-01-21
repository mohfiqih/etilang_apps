// import 'package:etilang_apps/views/history/history_tilang.dart';
import 'package:etilang_apps/views/history/history_users.dart';
import 'package:flutter/material.dart';

import 'package:etilang_apps/views/history/TabHistory.dart';

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
import 'package:etilang_apps/views/history/history.dart';

String selectedCategorie = "Adults";

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "History Simolang",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Text(
              //   "Data",
              //   style: TextStyle(
              //       color: Colors.black87.withOpacity(0.8),
              //       fontSize: 25,
              //       fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: 20,
              ),
              DoctorsTile(),
              SizedBox(
                height: 25,
              ),
              // Doctorslist(),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HistoryTilang()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 56, 2, 149),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            // Image.asset(
            //   "assets/calendar.png",
            //   height: 50,
            // ),
            Icon(
              Icons.data_exploration,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "History Tilang",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "History data tilang",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 202, 202, 202)),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 93, 0, 255),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Klik",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doctorslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HistoryUsers()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 89, 7, 233),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            // Image.asset(
            //   "assets/calendar.png",
            //   height: 50,
            // ),
            Icon(
              Icons.person_pin_outlined,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Data Users",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 19),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "History data user",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 217, 217, 217)),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 56, 2, 149),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Klik",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
