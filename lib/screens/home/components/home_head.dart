import 'package:flutter/material.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../map/map.dart';
import 'icon_btn_with_counter.dart';
//import '../../../size_config.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.width * 0.6,
        //child: Map(),
        decoration: BoxDecoration(
          /* image: DecorationImage(
            image: AssetImage('assets/images/wallet_home.png'),
            //alignment: Alignment.bottomLeft,
            alignment: Alignment(-0.8, 0.6),
            scale: 20,
          ), */
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade200,
              offset: Offset(0.0, 2.0),
              blurRadius: 0.0,
            ),
          ],
        ),
      ),
      Positioned(
          //right: getProportionateScreenWidth(15),
          left: 10.0,
          top: 25.0,
          child: Row(
            children: [
              Image(
                width: 140,
                height: 140,
                image: AssetImage('assets/images/wallet_home.png'),
              ),
              Column(children: [
                SizedBox(height: getProportionateScreenWidth(25)),
                Text(
                  "CONTENU DE VOTRE WALLET:",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'cursive',
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                Text(
                  "2000 COINS",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(25),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cursive',
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: getProportionateScreenWidth(15)),
                TextButton(
                    child: Text('Acheter un service'),
                    style: TextButton.styleFrom(
                      //primary: Colors.teal[200],
                      primary: Colors.white,
                      backgroundColor: Colors.amber,
                      textStyle: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    onPressed: () {}),
              ]),
            ],
          )),
      /*     Positioned(
        //right: getProportionateScreenWidth(15),
        left: 15.0,
        top: 15.0,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //color: Colors.white,
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
      ), */
      /* Positioned(
        right: 20.0,
        top: 15.0,
        child: FlatButton(
            onPressed: () => {},
            color: Colors.green[700],
            //padding: EdgeInsets.all(0.0),
            child: Column(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[Icon(Icons.add), Text("Voir la carte")],
            )),
      ),
       */
    ]);
  }
}
