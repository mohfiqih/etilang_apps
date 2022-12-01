// import 'dart:convert';
// // import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HistoryUsers extends StatefulWidget {
//   const HistoryUsers({Key? key}) : super(key: key);

//   @override
//   _HistoryUsers createState() => _HistoryUsers();
// }

// class User {
//   final int id;
//   final int email;
//   final String namalengkap;
//   final String password;
//   final String username;
//   final String tanggal;

//   User({
//     required this.id,
//     required this.email,
//     required this.namalengkap,
//     required this.password,
//     required this.username,
//     required this.tanggal,
//   });
// }

// class _HistoryUsers extends State<HistoryUsers> {
//   Future<List<User>> getRequest() async {
//     var url = Uri.parse("http://192.168.1.107:5000/api/data-users");
//     final response = await http.get(url);
//     var responseData = json.decode(response.body);

//     List<User> users = [];
//     for (var singleUser in responseData) {
//       User user = User(
//         id: singleUser["id"],
//         email: singleUser["email"],
//         namalengkap: singleUser["namalengkap"],
//         password: singleUser["password"],
//         username: singleUser["username"],
//         tanggal: singleUser["tanggal"],
//       );
//       users.add(user);
//     }
//     return users;

//     // List<User> users = [];
//     // final String baseUrl = "http://127.0.0.1:5000";

//     // void getRequest() async {
//     //   final Dio dio = new Dio();

//     //   try {
//     //     var response = await dio.get("$baseUrl/api/data-users");
//     //     print(response.statusCode);
//     //     print(response.data);
//     //     var responseData = response.data as List;

//     //     setState(() {
//     //       users = responseData.map((e) => User.fromJson(e));
//     //     });
//     //   } on DioError catch (e) {
//     //     print(e);
//     //   }
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('History Users'),
//         backgroundColor: Color.fromARGB(255, 0, 74, 126),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: FutureBuilder(
//           future: getRequest(),
//           builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Container(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (ctx, index) => ListTile(
//                   title: Text(snapshot.data[index].title),
//                   subtitle: Text(snapshot.data[index].body),
//                   contentPadding: EdgeInsets.only(bottom: 20.0),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//       // ignore: avoid_unnecessary_containers
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoryTilang extends StatelessWidget {
  const HistoryTilang({Key key}) : super(key: key);

  final String url = 'http://127.0.0.1:5000/api/data-tilang';

  Future getTilang() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getTilang();
    return Scaffold(
      appBar: AppBar(
        title: Text('History Tilang'),
      ),
      body: FutureBuilder(
          future: getTilang(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return Text('Data Tilang Ok');
              return ListView.builder(
                  itemCount: snapshot.data['tilang'].length,
                  itemBuilder: (context, index) {
                    // return Text(snapshot.data['data'][index]['username']);
                    return Container(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data['tilang'][index]['no_plat'],
                            ),
                            Text(
                              snapshot.data['tilang'][index]['tanggal'],
                            ),
                            Text(
                              snapshot.data['tilang'][index]['filename_plat'],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('Data Error');
            }
          }),
    );
  }
}
