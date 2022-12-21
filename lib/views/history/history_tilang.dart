import 'package:etilang_apps/views/home/coba_upload.dart';
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

import 'package:etilang_apps/models/tilang.dart';
import 'package:etilang_apps/service/tilangApi.dart';
import 'package:etilang_apps/views/upload/addUserForm.dart';
import 'package:etilang_apps/views/upload/updateUserForm.dart';

class HistoryTilang extends StatefulWidget {
  const HistoryTilang({Key key}) : super(key: key);

  @override
  State<HistoryTilang> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HistoryTilang> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Tilang> tilang;
  var isLoaded = false;

  @override
  void initState() {
    getRecord();
  }

  getRecord() async {
    tilang = await TilangApi().getAllTilang();
    if (tilang != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: tilang?.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(145, 117, 172, 255),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                children: <Widget>[
                  // Image.asset(
                  //   "assets/calendar.png",
                  //   height: 50,
                  // ),
                  SizedBox(
                    width: 17,
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 17,
                      ),
                      Text(
                        tilang[index].no_plat,
                        style: TextStyle(
                            color: Color.fromARGB(255, 40, 40, 40),
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        tilang[index].filename,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 92, 92, 92)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        tilang[index].pelanggaran,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 92, 92, 92)),
                      ),
                      Text(
                        tilang[index].filename_pelanggaran,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 92, 92, 92)),
                      ),
                      Text(
                        tilang[index].akurasi,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 92, 92, 92)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => Coba_upload()))
      //         .then((data) {
      //       if (data != null) {
      //         showMessageDialog("Success", "$data Detail Added Success.");
      //         getRecord();
      //       }
      //     });
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
