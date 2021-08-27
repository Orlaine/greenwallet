import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'card_widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    /* Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ), */
                    Text(
                      'MON COMPTE',
                      style: GoogleFonts.spartan(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                /* Text(
                  'MON COMPTE',
                  style: GoogleFonts.spartan(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ), */
                SizedBox(
                  height: 0,
                ),
                /* Text(
                  'You have 3 Active Cards',
                  style: GoogleFonts.spartan(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    //couleur grise
                    color: Color(0xff909090),
                  ), 
                ),*/
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              right: 15,
              top: 30,
            ),
            child: Container(
              height: 175,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CardWidget(
                    index: index,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
          )
        ],
      ),
    );
  }
}
