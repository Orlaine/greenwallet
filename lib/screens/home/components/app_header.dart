import 'package:flutter/material.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/cart/cart_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends PreferredSize {
  const HomeHeader({
    Key key,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F6F9),
      padding: EdgeInsets.fromLTRB(15.0, 30.0, 10.0, 4.0),
      //EdgeInsets.all(getProportionateScreenWidth(30)),
      // EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "GREEN WALLET",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              //fontFamily: 'cursive',
            ),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 3,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          SizedBox(
            height: 35,
            width: 35,
            child: Stack(
              fit: StackFit.expand,
              //overflow: Overflow.visible,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      //Mettre l'image de l'utilisateur
                      child: Image.asset("assets/images/account.png",
                          width: 100.0, height: 100.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
/*     return Container(
      color: Colors.white,
      padding:
          //EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          EdgeInsets.all(getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.7,
            child: Text(
              "GREEN WALLET",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'cursive',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 3,
            press: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(5)),
          ),
          SizedBox(
            height: 35,
            width: 35,
            child: Stack(
              fit: StackFit.expand,
              //overflow: Overflow.visible,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      //Mettre l'image de l'utilisateur
                      child: Image.asset('assets/images/Profile Image.png',
                          width: 100.0, height: 100.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ); */
  }
}
