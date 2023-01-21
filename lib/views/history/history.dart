import 'package:etilang_apps/dashboard.dart';
import 'package:etilang_apps/views/home/History.dart';
import 'package:etilang_apps/views/home/Profile.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

class HistoryTilang extends StatefulWidget {
  HistoryTilang({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _HistoryTilangState createState() => _HistoryTilangState();
}

class _HistoryTilangState extends State<HistoryTilang> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color.fromARGB(255, 56, 2, 149);
  final secondary = Color(0xfff29a94);

  // final List<Map> tilang = [
  //   {
  //     "name": "Edgewick Scchol",
  //     "location": "572 Statan NY, 12483",
  //     "type": "Higher Secondary School",
  //     "logoText":
  //         "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
  //   },
  // {
  //   "name": "Xaviers International",
  //   "location": "234 Road Kathmandu, Nepal",
  //   "type": "Higher Secondary School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
  // },
  // {
  //   "name": "Kinder Garden",
  //   "location": "572 Statan NY, 12483",
  //   "type": "Play Group School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
  // },
  // {
  //   "name": "WilingTon Cambridge",
  //   "location": "Kasai Pantan NY, 12483",
  //   "type": "Lower Secondary School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
  // },
  // {
  //   "name": "Fredik Panlon",
  //   "location": "572 Statan NY, 12483",
  //   "type": "Higher Secondary School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
  // },
  // {
  //   "name": "Whitehouse International",
  //   "location": "234 Road Kathmandu, Nepal",
  //   "type": "Higher Secondary School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
  // },
  // {
  //   "name": "Haward Play",
  //   "location": "572 Statan NY, 12483",
  //   "type": "Play Group School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
  // },
  // {
  //   "name": "Campare Handeson",
  //   "location": "Kasai Pantan NY, 12483",
  //   "type": "Lower Secondary School",
  //   "logoText":
  //       "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
  // },
  // ];
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
      // key: _drawerKey,
      // drawer: SizedBox(width: 100, child: SideMenu()),
      // appBar: !Responsive.isDesktop(context)
      //     ? AppBar(
      //         elevation: 0,
      //         backgroundColor: AppColors.white,
      //         leading: IconButton(
      //             onPressed: () {
      //               _drawerKey.currentState.openDrawer();
      //             },
      //             icon: Icon(Icons.menu, color: AppColors.black)),
      //         actions: [
      //           AppBarActionItems(),
      //         ],
      //       )
      //     : PreferredSize(
      //         preferredSize: Size.zero,
      //         child: SizedBox(),
      //       ),
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Visibility(
                visible: isLoaded,
                // padding: EdgeInsets.only(top: 145),
                // height: MediaQuery.of(context).size.height,
                // width: double.infinity,
                child: ListView.builder(
                    // itemCount: schoolLists.length,
                    itemCount: tilang?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              Container(
                height: 125,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        // key: _drawerKey,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => History()));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "History Tilang",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        },
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Data Tilang",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: secondary),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://img2.pngdownload.id/20190703/fls/kisspng-motorcycle-animation-illustration-vector-graphics-5d1c6100b611e5.2918980715621409287458.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tilang[index].no_plat,
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.motorcycle,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(tilang[index].pelanggaran,
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(tilang[index].tanggal,
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ),
                // Row(
                //   children: <Widget>[
                //     Icon(
                //       Icons.school,
                //       color: secondary,
                //       size: 20,
                //     ),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text(tilang[index].akurasi,
                //         style: TextStyle(
                //             color: primary, fontSize: 13, letterSpacing: .3)),
                //   ],
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
