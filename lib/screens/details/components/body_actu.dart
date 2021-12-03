import 'package:flutter/material.dart';
import 'package:green_wallet/components/default_button.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/size_config.dart';

//import 'color_dots.dart';
import 'actu_description.dart';
import 'actu_images.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class BodyActu extends StatelessWidget {
  final Actuality actuality;

  const BodyActu({Key key, @required this.actuality}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ActuImages(actuality: actuality),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ActuDescription(
                actuality: actuality,
                pressOnSeeMore: () {},
              ),
              //TopRoundedContainer(
              Container(
                //color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //ColorDots(product: product),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(110),
                        ),
                        /* child: DefaultButton(
                          text: "Ajouter au panier",
                          press: () {},
                        ), */
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
