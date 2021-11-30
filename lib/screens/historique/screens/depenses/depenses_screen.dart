import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';
import 'package:green_wallet/screens/historique/screens/depenses/body.dart';

class DepensesScreen extends StatelessWidget {
  static String routeName = "/depenses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text("Historique de mes dépenses"),
      ),
      body: Body(),
    );
  }
}
