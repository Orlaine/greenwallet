import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class CardWidget extends StatelessWidget {
  final int index;
  CardWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* if (index == 0)
      return Container(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Container(
          height: 175,
          width: MediaQuery.of(context).size.width - 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //couleur orange
            color: Color(0xfffe752f),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    tooltip: 'KYC',
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, top: 25, bottom: 10, right: 20),
                    child: Text(
                      'VISA',
                      style: GoogleFonts.spartan(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
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
                      left: 15,
                      top: 10,
                      bottom: 15,
                    ),
                    child: Text(
                      '4562 1122 4595 7852',
                      style: GoogleFonts.spartan(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 25,
                                bottom: 10,
                                right: 20,
                              ),
                              child: Text(
                                'CARD HOLDER',
                                style: GoogleFonts.spartan(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 0,
                                bottom: 10,
                                right: 20,
                              ),
                              child: Text(
                                'Ghulam',
                                style: GoogleFonts.spartan(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 25,
                                bottom: 10,
                                right: 20,
                              ),
                              child: Text(
                                'Expiry Date',
                                style: GoogleFonts.spartan(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 0,
                                bottom: 10,
                                right: 20,
                              ),
                              child: Text(
                                '24/2020',
                                style: GoogleFonts.spartan(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
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
      ); */
    if (index == 0)
      return Container(
        padding: EdgeInsets.only(
          left: 1,
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
                  Color(0xFF313131),
                  /***********Couleur primaire**************/
                  //kPrimaryColor,
                  Color(0xFF43ff7c),
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
                      color: Colors.white,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
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
                      left: 15,
                      top: 10,
                      bottom: 15,
                    ),
                    child: Text(
                      '4562 1122 4595 7852',
                      style: GoogleFonts.spartan(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 25, bottom: 10, right: 20),
                              child: Text(
                                'PROPRIETAIRE',
                                style: GoogleFonts.spartan(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 0, bottom: 10, right: 20),
                              child: Text(
                                'Ghulam',
                                style: GoogleFonts.spartan(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 25, bottom: 10, right: 20),
                              child: Text(
                                'MON SOLDE',
                                style: GoogleFonts.spartan(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 0, bottom: 10, right: 20),
                              child: Text(
                                '20000 Coins',
                                style: GoogleFonts.spartan(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
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
