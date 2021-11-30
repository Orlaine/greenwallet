import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_wallet/screens/historique/screens/depenses/depenses_screen.dart';
import 'package:green_wallet/screens/historique/screens/depots/depot_screen.dart';
import 'package:green_wallet/screens/home/home_screen.dart';

class HomeHistorique extends StatefulWidget {
  @override
  _HomeHistoriqueState createState() => _HomeHistoriqueState();
}

class _HomeHistoriqueState extends State<HomeHistorique> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return /* Scaffold(
      body: */
        Stack(
      children: <Widget>[
        /* Container(
          height: size.height * .3,
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/top_header.png')),
          ),
        ), */
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 29),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                      //SizedBox(height: 9),
                      /* Row(
                        children: <Widget>[ */
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DepotScreen.routeName);
                          print("tapped");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                  onPressed: null,
                                  child: SvgPicture.asset(
                                    "assets/icons/depot.svg",
                                    height: 128,
                                  )),
                              /* SvgPicture.asset(
                                "assets/icons/depot.svg",
                                height: 128,
                              ), */
                              Text(
                                'Mes dépôts',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, DepensesScreen.routeName);
                          print("tapped2");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/icons/depenses.svg",
                                height: 128,
                              ),
                              Text(
                                'Mes dépenses',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /* Positioned(
                  //top: 130,
                  //child: Image.asset("assets/images/recycle.jpg", width: 290),
                  /* child: Image.asset(
                    "assets/images/recycle.jpg",
                    width: 600.0,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ), */
                  child: SvgPicture.asset("assets/icons/stats.svg", width: 290),
                ), */
                //SizedBox(height: 29),
                Image.asset(
                  'assets/images/recycle.jpg',
                  width: 1900.0,
                  height: 194.0,

                  //fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
