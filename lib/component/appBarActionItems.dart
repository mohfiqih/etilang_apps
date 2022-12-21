import 'package:etilang_apps/dashboard.dart';
import 'package:etilang_apps/views/home/Inbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:etilang_apps/style/colors.dart';
import 'package:etilang_apps/views/home/Profile.dart';
// import 'package:url_launcher/url_launcher';

class AppBarActionItems extends StatelessWidget {
  // const AppBarActionItems({
  //   Key key,
  // }) : super(key: key);

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  String url = 'https://www.youtube.com/';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            }),
        SizedBox(width: 15),
        IconButton(
            iconSize: 22,
            icon: Icon(
              Icons.chat_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // url;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatBubble()));
            }),
        SizedBox(width: 15),
        IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.person_pin,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profil()));
            }),
      ],
    );
  }
}
