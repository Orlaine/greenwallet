import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';
import 'package:green_wallet/screens/factures/body.dart';

class FactureScreen extends StatelessWidget {
  static String routeName = "/factures";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text("Mes factures"),
      ),
      body: Body(),
    );
  }
}
