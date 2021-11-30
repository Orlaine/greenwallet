import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/enums.dart';
import 'component/home_historique.dart';

class HistoriqueScreen extends StatelessWidget {
  static String routeName = "/historique";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text("Historique"),
      ),
      body: HomeHistorique(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
