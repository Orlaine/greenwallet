import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/actuality/components/content_home_actu.dart';
import 'package:green_wallet/screens/tickets/home_ticket_screen.dart';
import 'package:green_wallet/widgets/product_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

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
            /* children: [
              FutureBuilder<QuerySnapshot>(
                future: _productsRef.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  // Collection Data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Display the data inside a list view
                    return ListView(
                      children: snapshot.data.docs.map((document) {
                        return
                            Ticket_Card(
                          title: document.data()['nom'],
                          imageUrl: document.data()['images'],
                          price: "\$${document.data()['price']}",
                          productId: document.id,
                        );
                      }).toList(),
                    );
                  }

                  // Loading State
                  return CircularProgressIndicator();
                },
              ),
            ], */
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
