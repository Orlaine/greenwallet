import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_wallet/screens/factures/facture_screen.dart';
import 'package:green_wallet/screens/historique/historique_screen.dart';
import 'package:green_wallet/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  Future<String> getName() async {
    String name = '';
    //await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (_auth.currentUser != null) {
      print(_auth.currentUser.phoneNumber);
      print(_auth.currentUser.displayName);
      print(_auth.currentUser.uid);
      final data = await firestore
          .collection('clients')
          .doc(_auth.currentUser.uid)
          .get();
      name = data['username'].toString();
      print('***************$name*************');
      return name;
    } else {
      print('***************ce n\'est pas bon*************');
      return null;
    }
  }

  Future<String> getPhone() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (_auth.currentUser != null) {
      print(_auth.currentUser.phoneNumber);
      print(_auth.currentUser.displayName);
      print(_auth.currentUser.uid);
      return _auth.currentUser.phoneNumber;
    } else {
      print('***************ce n\'est pas bon*************');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(children: [
            SizedBox(width: 30),
            ProfilePic(),
            SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FutureBuilder<String>(
                  future: getName(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        //"ANNE",
                        "Salut ${snapshot.data} !",
                        style: GoogleFonts.spartan(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      );
                    } else {
                      return Text(
                        "Salut Anonyme!",
                        style: GoogleFonts.spartan(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      );
                    }
                  }),
              SizedBox(height: 10),
              //Text("phoneNuumber: phoneNuumber"),
              FutureBuilder<String>(
                  future: getPhone(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        //"ANNE",
                        "Numéro: ${snapshot.data}",
                        style: GoogleFonts.spartan(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      );
                    } else {
                      return Text(
                        "Téléphone: 622 34 56 78",
                        style: GoogleFonts.spartan(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      );
                    }
                  }),
            ])
          ]),
          //ProfilePic(),
          SizedBox(height: 20),
          //Text("Username: username"),
          /* FutureBuilder<String>(
              future: getName(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    //"ANNE",
                    "Username: ${snapshot.data}",
                    style: GoogleFonts.spartan(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  );
                } else {
                  return Text(
                    "Username: Ana",
                    style: GoogleFonts.spartan(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  );
                }
              }),
          SizedBox(height: 10),
          //Text("phoneNuumber: phoneNuumber"),
          FutureBuilder<String>(
              future: getPhone(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    //"ANNE",
                    "Téléphone: ${snapshot.data}",
                    style: GoogleFonts.spartan(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  );
                } else {
                  return Text(
                    "Téléphone: 622 34 56 78",
                    style: GoogleFonts.spartan(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  );
                }
              }), */
          SizedBox(height: 10),
          ProfileMenu(
            text: "Mes factures",
            icon: "assets/icons/Parcel.svg",
            press: () {
              Navigator.pushNamed(context, FactureScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Mon historique",
            icon: "assets/icons/Flash Icon.svg",
            press: () {
              Navigator.pushNamed(context, HistoriqueScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Deconnexion",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, SignInScreen.routeName);
              await Firebase.initializeApp();
              final FirebaseAuth _auth = FirebaseAuth.instance;
              if (_auth.currentUser != null) {
                print("C'est pas bonn, l'utilisateur n'est pas déconnecté");
                print("Voici: ${_auth.currentUser.uid}");
              } else {
                print("C'est bon, l'utilisateur est déconnecté");
              }
            },
          ),
        ],
      ),
    );
  }
}
