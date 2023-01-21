import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
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

import 'package:etilang_apps/models/tilang.dart';

void main() {
  runApp(MyHomePage());
}

class Coba_upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Upload Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  File selectedImage;
  // var resJson;

  var no_plat = "";
  var pelanggaran = "";
  var tanggal = "";

  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.208.106:5000/api/tilang"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );

    var duration = const Duration(seconds: 2);

    final alert = AlertDialog(
      title: Text("Notif"),
      content: Text("Sedang memproses gambar..."),
      // actions: [
      //   ElevatedButton(
      //     child: Text("OK"),
      //     // onPressed: onUploadImage,
      //   ),
      // ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    request.headers.addAll(headers);
    print("request: " + request.toString());

    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);

    setState(() {
      var resJson = jsonDecode(response.body);
      no_plat = resJson["Nomor Plat"];
      pelanggaran = resJson["Pelanggaran"];
      tanggal = resJson["Tanggal"];

      print(response.body);
    });
  }

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  Future fotoKamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile imagePicked =
        await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      selectedImage = File(imagePicked.path);
    });
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
                      // fotoGaleri();
                      getImage();
                    }),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: Container(
        margin: new EdgeInsets.all(20.00),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            selectedImage == null
                ? Text(
                    'Pilih image terlebih dahulu',
                    style: const TextStyle(fontSize: 15),
                  )
                : Image.file(selectedImage),
            SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: onUploadImage,
              style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 56, 2, 149),
                  textStyle: const TextStyle(fontSize: 16)),
              child: const Text('Upload Image'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 440,
                  height: 540,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text("Nomor Plat")),
                      DataColumn(label: Text("Pelanggaran")),
                      DataColumn(label: Text("Tanggal")),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "$no_plat",
                          style: TextStyle(fontSize: 12),
                        )),
                        // Sidebox(),
                        DataCell(
                          Text("$pelanggaran", style: TextStyle(fontSize: 12)),
                        ),
                        DataCell(
                            Text("$tanggal", style: TextStyle(fontSize: 12))),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   tooltip: 'Increment',
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.image, color: AppColors.black),
      // ),
    );
  }
}
