import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:etilang_apps/constant.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/login.svg"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: 1),
      ],
    );
  }
}
