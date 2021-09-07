import 'package:flutter/material.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
      //bottomNavigationBar: BottomBar(selectedMenu: MenuState.profile),
    );
  }
}
