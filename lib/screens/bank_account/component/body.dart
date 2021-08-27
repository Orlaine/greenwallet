import 'package:flutter/material.dart';
import 'package:green_wallet/screens/bank_account/component/green_card.dart';

import 'chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          CardScreen(),
          BarChartSample2(),
        ],
      ),
    ));
  }
}
