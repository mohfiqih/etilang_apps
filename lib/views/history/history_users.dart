import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class HistoryUsers extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final String url = 'http://10.0.2.2/user/flutter';

  Future getTilang() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getTilang();
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
      body: FutureBuilder(
          future: getTilang(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text('Data Tilang Ok');
              return ListView.builder(
                  itemCount: snapshot.data['users'].length,
                  itemBuilder: (context, index) {
                    // return Text(snapshot.data['data'][index]['username']);
                    return Container(
                      height: 80,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data['users'][index]['namalengkap'],
                            ),
                            Text(
                              snapshot.data['users'][index]['email'],
                            ),
                            Text(
                              snapshot.data['users'][index]['tanggal'],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('Error');
            }
          }),
    );
  }
}
