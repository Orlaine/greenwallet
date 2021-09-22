import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/actuality/components/home_actu.dart';
import 'package:green_wallet/screens/tickets/home_ticket_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Tickets à la une",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeTicketScreen(
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
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(
                      product: demoProducts[index],
                      press: () {},
                    );

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
