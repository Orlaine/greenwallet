import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/cart/cart_screen.dart';
import 'package:green_wallet/screens/profile/components/avatar.dart';
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
    /* FutureBuilder<List<Achats>>(
        future: listDep,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int items = (snapshot.data).length;
          }
        }); */
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
//************************************************************************************* */
            numOfitem: 0,
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
                    child: Avatar(),
                    /* ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      //Mettre l'image de l'utilisateur
                      child: Image.asset("assets/images/account.png",
                          width: 100.0, height: 100.0),
                    ), */
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

class Achats {
  String title;
  int prix;
  String image;
  String description;
  Achats({this.title, this.prix, this.image, this.description});

  factory Achats.fromJSON(Map<String, dynamic> parsedJson) {
    return Achats(
      title: parsedJson['title'],
      prix: parsedJson['prix'],
      image: parsedJson['image'],
      description: parsedJson['description'],
    );
  }
}

Future<List<Achats>> fetchDep() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  Response response = await Dio().get(
      'https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/${auth.currentUser.uid}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var getData = response.data['data']['panier'] as List;
    return getData.map((i) => Achats.fromJSON(i)).toList();
    //return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Erreur de chargement');
  }
}
