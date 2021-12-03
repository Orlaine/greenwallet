import 'package:flutter/material.dart';
import 'package:green_wallet/components/actu_card.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/actuality/components/content_home_actu.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularActuality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Quelques astuces",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContentHomeActuScreen(
                        //article: widget.article,
                        )));
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoActuality.length,
                (index) {
                  if (demoActuality[index].isPopular)
                    return ActuCard(actuality: demoActuality[index]);
                  //return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
