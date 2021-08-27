import 'package:flutter/material.dart';
import 'package:green_wallet/constants.dart';

//import '../constants.dart';
//import '../enums.dart';

class CustomBottomBar extends PreferredSize {
  CustomBottomBar();
  //final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 55),
      decoration: BoxDecoration(
        color: Colors.white,
        /* boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ], 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),*/
      ),
      child: SizedBox(
        height: 50,
        width: 0,
        child: TextButton(
            child: Text('Ajouter au panier'),
            style: TextButton.styleFrom(
              //primary: Colors.teal[200],
              primary: Colors.white,
              backgroundColor: kPrimaryColor,
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
            onPressed: () {}),
      ),
      /* child: TextButton(
          child: Text('Ajouter au panier'),
          style: TextButton.styleFrom(
            primary: Colors.teal[200],
            backgroundColor: Colors.blueGrey,
            textStyle: TextStyle(color: Colors.black, fontSize: 25),
          ),
          onPressed: () {}), */
    );
  }
}
