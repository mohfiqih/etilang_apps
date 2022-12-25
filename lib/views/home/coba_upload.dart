import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
  var resJson;

  onUploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:5000/api/tilang"),
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
    request.headers.addAll(headers);
    print("request: " + request.toString());

    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);

    setState(() {
      resJson = jsonDecode(response.body);
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
    // image = File(imagePicked.path);
    // setState(() {});

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
        margin: new EdgeInsets.all(30.00),
        child: Center(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                height: 10,
                // height: 100,
              ),
              TextButton(
                  onPressed: onUploadImage,
                  style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Color.fromARGB(255, 56, 2, 149),
                      textStyle: const TextStyle(fontSize: 16)),
                  child: const Text('Upload Image')
                  // onPressed: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Coba_upload()));
                  // },
                  ),
              // Card(
              //   elevation: 0,
              //   color: Color.fromARGB(255, 56, 2, 149),
              //   child: Container(
              //       height: 50,
              //       child: InkWell(
              //         splashColor: Colors.white,
              //         child: Center(
              //           child: Text(
              //             "Tambah Foto",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ), // Center
              //         // onTap: () {},
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Coba_upload()));
              //         },
              //       )),
              // ),
              // Text(
              //   "Output : $resJson",
              //   style: const TextStyle(fontSize: 16),
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Output :",
                style: TextStyle(
                    color: Color.fromARGB(255, 40, 40, 40), fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$resJson",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 92, 92, 92)),
              ),
              // resJson == null
              //     ? Text(
              //         'Hasil :',
              //       )
              //     : jsonDecode(resJson),
              // Text(resJson),
              // Text('Hasil: '),
            ],
          ),
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
