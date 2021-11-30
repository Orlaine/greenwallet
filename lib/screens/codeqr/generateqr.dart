import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_wallet/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../size_config.dart';

class GenerateQR extends StatefulWidget {
  static String routeName = "/qrcode";
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class _GenerateQRState extends State<GenerateQR> {
  //String qrData = "A46UeMPOzSPrWjqEbAQDrNvrlTz";
  String qrData = "${_auth.currentUser.uid}";
  final qrdataFeed = TextEditingController();

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Text("Scanner le QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(65.0, 10.0, 65.0, 4.0),
        //EdgeInsets.all(40),
        child: SingleChildScrollView(
          //Scroll view given to Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5),
              QrImage(data: qrData),
              SizedBox(height: 5),
              /* Text(
                "Generate QR Code",
                style: TextStyle(fontSize: 20),
              ), */
              /*
              //TextField for input link
              TextField(
                decoration:
                    InputDecoration(hintText: "Enter your link here..."),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                //Button for generating QR code
                child: FlatButton(
                  onPressed: () async {
                    //a little validation for the textfield
                    if (qrdataFeed.text.isEmpty) {
                      setState(() {
                        qrData = "";
                      });
                    } else {
                      setState(() {
                        qrData = qrdataFeed.text;
                      });
                    }
                  },
                  //Title given on Button
                  child: Text(
                    "Generate QR Code",
                    style: TextStyle(
                      color: Colors.indigo[900],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.indigo[900]),
                  ),
                ),
              ), */
              SizedBox(height: 15),
              Text(
                "   Votre identifiant est:",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "$qrData",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
