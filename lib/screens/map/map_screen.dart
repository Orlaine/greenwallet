import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';
import 'package:green_wallet/screens/map/map.dart';

class GMapScreen extends StatelessWidget {
  static String routeName = "/gmap";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: GMap(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.gmap),
    );
  }
}
