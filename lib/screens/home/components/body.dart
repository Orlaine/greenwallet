import 'package:flutter/material.dart';
import 'package:green_wallet/screens/home/components/popular_actuality.dart';
import 'package:green_wallet/screens/home/components/view.dart';

import '../../../size_config.dart';
import 'card.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_head.dart';
import 'app_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //child: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: getProportionateScreenHeight(10)),
            //HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(12)),
            CardWidget(),
            //HomeHead(),
            SizedBox(height: getProportionateScreenWidth(15)),
            ViewMap(),
            SizedBox(height: getProportionateScreenWidth(20)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(40)),
            //PopularActuality(),
            /* SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)), */
          ],
        ),
      ),
    );
  }
}
