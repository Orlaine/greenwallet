import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_wallet/screens/otp/components/otp_form.dart';
import '../../../constants.dart';

class CardWidget extends StatelessWidget {
  //final int index;
  CardWidget({
    Key key,
    //  this.index,
  }) : super(key: key);

  String name = '';
  String wallet = '';
  String datetime = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getName() async {
    //await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (_auth.currentUser != null) {
      print(
          "********************<<<<<<<<<<<<${_auth.currentUser.uid}>>>>>>>>>>>>>>>>****************");
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

  Future<String> getDate() async {
    //await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (_auth.currentUser != null) {
      final data = await firestore
          .collection('clients')
          .doc(_auth.currentUser.uid)
          .get();
      datetime = data['createdAt'].toString();
      print('***************$datetime*************');
      return datetime;
    } else {
      print('***************ce n\'est pas bon*************');
      return null;
    }
  }

  Future<String> getCoin() async {
    //await Firebase.initializeApp();
    //final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (_auth.currentUser != null) {
      print(_auth.currentUser.phoneNumber);
      print(_auth.currentUser.displayName);
      print(_auth.currentUser.providerData);
      final variable = await firestore
          .collection('clients')
          .doc(_auth.currentUser.uid)
          .get();
      wallet = variable['somme_wallet'].toString();
      print(
          '***************<<<<<<<<<<<<<<<<<<$wallet>>>>>>>>>>>>>>>>>>*************');
      return wallet;
    } else {
      print('***************ce n\'est pas bon*************');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const kColor = Colors.white;
    //  if (index == 0)
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        height: 175,
        width: MediaQuery.of(context).size.width - 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                //ColorConstants.cblackColor,
                kPrimaryColor,
                //Color(0xFF54ea82),
                /***********Couleur primaire**************/
                //kPrimaryColor,
                //Color(0xFF43ff7c),
                Color(0xFFc2d3b4),
                Color(0xFFc2d3b4),
                Color(0xFFc2d3b4),
                //Color(0xFFb8b8b8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.credit_card,
                    color: kColor,
                  ),
                  onPressed: () {},
                  tooltip: 'KYC',
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 25,
                    bottom: 10,
                    right: 20,
                  ),
                  child: Text(
                    'GREEN CARD',
                    style: GoogleFonts.spartan(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(
                      left: 43,
                      top: 13,
                      bottom: 15,
                    ),
                    child: Row(children: [
                      /* Icon(
                        Icons.monetization_on_outlined,
                        color: kColor,
                        size: 21,
                      ), */
                      /* Container(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          'MON SOLDE:',
                          style: GoogleFonts.spartan(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: kColor,
                          ),
                        ),
                      ), */
                      FutureBuilder(
                          future: getCoin(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                //"100",
                                snapshot.data,
                                style: GoogleFonts.spartan(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber[100],
                                ),
                              );
                            } else {
                              return Text(
                                "...",
                                //snapshot.data,
                                style: GoogleFonts.spartan(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber[100],
                                ),
                              );
                            }
                          }),
                      Container(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          ' Coins',
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kColor,
                          ),
                        ),
                      ),
                    ])),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, top: 15, bottom: 10, right: 20),
                            child: Text(
                              'PROPRIETAIRE',
                              style: GoogleFonts.spartan(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                color: kColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, top: 0, bottom: 10, right: 20),
                            child: FutureBuilder<String>(
                                future: getName(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      //"ANNE",
                                      snapshot.data,
                                      style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return Text(
                                      "...",
                                      style: GoogleFonts.spartan(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    );
                                  }
                                }),

                            //),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, top: 15, bottom: 10, right: 20),
                            child: Text(
                              'DEPUIS LE:',
                              style: GoogleFonts.spartan(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                color: kColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15, top: 0, bottom: 10, right: 20),
                            child: FutureBuilder<String>(
                                future: getDate(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      //"ANNE",
                                      snapshot.data,
                                      style: GoogleFonts.spartan(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          color: kColor),
                                    );
                                  } else {
                                    return Text(
                                      "...",
                                      style: GoogleFonts.spartan(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          color: kColor),
                                    );
                                  }
                                }),
                            /* child: Text(
                              'DEPUIS LE: 31/08/21',
                              style: GoogleFonts.spartan(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: kColor,
                              ),
                            ), */
                          ),
                        ],
                      ),
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
