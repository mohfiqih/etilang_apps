import 'package:etilang_apps/dashboard.dart';
import 'package:etilang_apps/views/home/History.dart';
import 'package:etilang_apps/views/home/Inbox.dart';
import 'package:etilang_apps/views/home/Kamera.dart';
import 'package:etilang_apps/views/home/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:etilang_apps/config/size_config.dart';
import 'package:etilang_apps/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/mac-action.svg'),
                ),
              ),
              IconButton(
                  iconSize: 27,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }),
              IconButton(
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(
                    Icons.inventory_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => History()));
                  }),
              IconButton(
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kamera()));
                  }),
              IconButton(
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatBubble()));
                  }),
              IconButton(
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profil()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
