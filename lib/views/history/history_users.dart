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

import 'package:etilang_apps/models/user.dart';
import 'package:etilang_apps/service/userApi.dart';
import 'package:etilang_apps/views/upload/addUserForm.dart';
import 'package:etilang_apps/views/upload/updateUserForm.dart';

class HistoryUsers extends StatefulWidget {
  const HistoryUsers({Key key}) : super(key: key);

  @override
  State<HistoryUsers> createState() => _HistoryUsers();
}

class _HistoryUsers extends State<HistoryUsers> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<User> users;
  var isLoaded = false;

  @override
  void initState() {
    getRecord();
  }

  getRecord() async {
    users = await UserApi().getAllUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<void> showMessageDialog(String title, String msg) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(
              msg,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
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
            itemCount: users?.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(145, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 17,
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email : " + users[index].email,
                          style: TextStyle(
                              color: Color.fromARGB(255, 40, 40, 40),
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Password : " + users[index].password,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 92, 92, 92)),
                        ),
                        // Text(
                        //   "Tanggal : " + users[index].tanggal,
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       color: Color.fromARGB(255, 92, 92, 92)),
                        // ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 77, 77),
                          borderRadius: BorderRadius.circular(13)),
                      child: Text(
                        "Hapus",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addUserForm()))
              .then((data) {
            if (data != null) {
              showMessageDialog("Success", "$data Detail Added Success.");
              getRecord();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
