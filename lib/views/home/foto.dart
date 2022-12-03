import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class Foto extends StatefulWidget {
  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  File image;

  Future fotoKamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile imagePicked =
        await _picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked.path);
    setState(() {});
  }

  Future fotoGaleri() async {
    final ImagePicker _picker = ImagePicker();
    final XFile imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked.path);
    setState(() {});
  }

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
              actions: <Widget>[
                // AppBarActionItems(),
                IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () {
                      fotoKamera();
                    }),
                IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.add_photo_alternate),
                    onPressed: () {
                      fotoGaleri();
                    }),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 400,
              child:
                  image == null ? Text('No Image To Show') : Image.file(image),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "Caption",
                  hintText: "Masukkan Caption",
                  border: OutlineInputBorder()), // InputDecoration
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 0,
              color: Color.fromARGB(255, 56, 2, 149),
              child: Container(
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.white,
                    child: Center(
                      child: Text(
                        "Tambah Foto",
                        style: TextStyle(color: Colors.white),
                      ),
                    ), // Center
                    onTap: () {},
                  )),
            )
          ],
        ),
      ),
    );
  }
}
