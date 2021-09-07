import 'package:flutter/material.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/map/map_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';
//import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class ViewMap extends StatelessWidget {
  const ViewMap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFFF5F6F9),

      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Vous recherchez une GreenBox?",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(14),
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          TextButton(
              child: Text('Voir la Carte'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.amber,
                //side: BorderSide(color: Colors.deepOrange, width: 1),
                elevation: 5,
                //minimumSize: Size(10, 50),
                //shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),

                /*primary: Colors.teal[200],
                primary: Colors.white,
                backgroundColor: Colors.amber,
                textStyle: TextStyle(color: Colors.black, fontSize: 10),*/
              ),
              onPressed: () {
                Navigator.pushNamed(context, GMapScreen.routeName);
              }),
        ],
      ),
    );
  }
}
