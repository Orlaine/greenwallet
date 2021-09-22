import 'package:flutter/material.dart';
import 'package:green_wallet/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            "Mon panier",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 10),
          Text(
            "(${demoCarts.length} articles)",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
