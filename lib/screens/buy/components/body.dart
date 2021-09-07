import 'package:flutter/material.dart';
import 'package:green_wallet/components/search_bar.dart';
import 'package:green_wallet/screens/buy/components/tab.dart';
import 'package:green_wallet/screens/home/components/app_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [HomeHeader(), SearchBar(), Expanded(flex: 1, child: Tabs())],
    ));
  }
}
