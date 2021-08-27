import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ActuCard extends StatelessWidget {
  const ActuCard({
    Key key,
    //Taille du box
    this.width = 220,
    //this.aspectRetio = 2.02,
    @required this.actuality,
  }) : super(key: key);

  final double width;
  //, aspectRetio;
  final Actuality actuality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Espace entre les lignes
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            //arguments: ProductDetailsArguments(Actuality: actuality),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                //Longueur du box
                aspectRatio: 0.7,
                child: Container(
                  //Bordure globales
                  //padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    //Rondeur des bords
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Hero(
                    tag: actuality.id.toString(),
                    child: Column(children: [
                      Container(
                        height: 190,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(actuality.images),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Padding(
                          //padding: const EdgeInsets.only(right: 5),
                          //Padding des écritures
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    actuality.title,
                                    /****** Pourquoi ça ne part pas à la ligne? ******/
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                //Mettre la vrai date
                                "20/07/21",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "by " + actuality.author,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        //Mettre le logo du partenaire
                                        image: AssetImage(actuality.images),
                                        //image: AssetImage(actuality.authorImg),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                    //child: Image.asset(actuality.images),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
