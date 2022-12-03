import 'package:etilang_apps/dashboard.dart';
import 'package:etilang_apps/views/home/Inbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:etilang_apps/style/colors.dart';
import 'package:etilang_apps/views/home/Profile.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key key,
  }) : super(key: key);

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
