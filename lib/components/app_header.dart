import 'package:flutter/material.dart';
import 'package:green_wallet/screens/cart/cart_screen.dart';
import 'package:green_wallet/screens/home/components/icon_btn_with_counter.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../../../size_config.dart';

class AppHeader extends PreferredSize {
  final String head;

  AppHeader({@required this.head});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            //EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
            EdgeInsets.fromLTRB(2, 0, 10, 0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              "$head",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconBtnWithCounter(
                  svgSrc: "assets/icons/Cart Icon.svg",
                  numOfitem: 3,
                  press: () =>
                      Navigator.pushNamed(context, CartScreen.routeName),
                ),
                SizedBox(width: getProportionateScreenHeight(10)),
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
                            child: Image.asset(
                                'assets/images/Profile Image.png',
                                width: 100.0,
                                height: 100.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
