import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/buy/buy_screen.dart';
import 'package:green_wallet/components/fab_bottom_appbar.dart';
import 'package:green_wallet/screens/map/map_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import 'components/app_header.dart';
import 'components/body.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: HomeHeader(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      /* floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
          elevation: 2.0,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FABBottomAppBar(
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Acceuil'),
            FABBottomAppBarItem(iconData: Icons.payment, text: 'Acheter'),
            FABBottomAppBarItem(iconData: Icons.map, text: 'Carte'),
            FABBottomAppBarItem(
                iconData: Icons.local_activity, text: 'Actualite')
          ],
          selectedColor: kPrimaryColor,
          color: Colors.grey,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (index) {
            switch (index) {
              case 0:
               Navigator.pushNamed(context, HomeScreen.routeName);
                break;
              case 1:
                Navigator.pushNamed(context, BuyScreen.routeName);
                break;
              case 2:
                Navigator.pushNamed(context, GMapScreen.routeName);
                break;
              case 3:
                Navigator.pushNamed(context, ProfileScreen.routeName);
                break;
            }
          },
        ) */
    );
  }
}
