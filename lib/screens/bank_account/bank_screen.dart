import 'package:flutter/material.dart';
import 'package:green_wallet/screens/bank_account/component/body.dart';

class BankScreen extends StatelessWidget {
  static String routeName = "/bank";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
