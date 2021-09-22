import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  const Avatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return avatarUrl == null
        ? CircleAvatar(
            radius: 50.0,
            backgroundColor: Color(0xFFFeeefee),
            //backgroundColor: Colors.green,
            backgroundImage: AssetImage("assets/images/account_i.png"),
            //child: SvgPicture.asset("assets/images/account.png"),
          )
        : CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(avatarUrl),
          );
  }
}
