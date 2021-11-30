import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/tickets/component/content_home_ticket.dart';

import '../constants copy.dart';

class Ticket_Card extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;
  Ticket_Card(
      {this.onPressed, this.imageUrl, this.title, this.price, this.productId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductCard(
                product: demoProducts[1],
                press: () {},
              ),
              /* ContentHomeTicketScreen(
                  productId: productId,
                  ), */
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: 350.0,
        margin: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            Container(
              height: 350.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  "$imageUrl",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Constants.regularHeading,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
 
/* 
import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:green_wallet/screens/tickets/component/content_home_ticket.dart';

import '../constants copy.dart';
import '../constants.dart';
import '../size_config.dart';

class Ticket_Card extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;
  Ticket_Card(
      {this.onPressed, this.imageUrl, this.title, this.price, this.productId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Espace entre les différents blocs
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(130),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  //Espace entre le contenu et le bloc
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Hero(
                    tag: productId,
                    child: Image.network(
                      "$imageUrl",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(color: Colors.black),
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price coins",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/actuality/components/actu_container.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:green_wallet/screens/home/components/search_field.dart';
import 'package:green_wallet/screens/tickets/component/ticket_container.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../enums.dart';
import '../../../size_config.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ContentHomeTicketScreen extends StatefulWidget {
  @override
  _ContentHomeTicketScreenState createState() =>
      _ContentHomeTicketScreenState();
}

class _ContentHomeTicketScreenState extends State<ContentHomeTicketScreen>
    with SingleTickerProviderStateMixin {
  List list_name = [
    "Forfait",
    "Télephone",
    "Transport",
    "Bon d'achat",
    "Alimentation"
  ];
  SwiperController _scrollController = new SwiperController();
  TabController tabController;
  Product ticket;
  int currentindex2 = 0; // for swiper index initial
  int selectedIndex = 0; // for tab

  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
  }

  Widget buildTicketContainers() {
    List<Widget> ticketContainers = [];
    for (Product ticket in demoProducts) {
      ticketContainers.add(TicketCard(
        width: 130,
        aspectRetio: 1.02,
        product: ticket,
      ));
    }
    return Column(
      children: ticketContainers,
    );
  }

  @override
  Widget build(BuildContext context) {
    //final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: list_name.length,
      child: Container(
        child: Column(
          children: [
            SearchField(),
            Container(
                padding: EdgeInsets.only(top: 10),
                height: 70,
                child: DefaultTabController(
                  length: list_name.length,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 35.0),
                    child: Material(
                      child: TabBar(
                        onTap: (index) => _scrollController.move(index),
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 12),
                        unselectedLabelColor: Colors.black,
                        tabs: List<Widget>.generate(list_name.length,
                            (int index) {
                          return new Tab(text: list_name[index]);
                        }),
                      ),
                    ),
                  ),
                )),
            /* SizedBox(
              height: 5,
            ), */
            Expanded(
              child: new Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;
                    print(index);
                  });
                },
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;
                    print(index);
                  });
                },
                duration: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return new Swiper(
                    duration: 2,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          //padding: EdgeInsets.only(top: 20),
                          height: 1500,
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: demoProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 15.0,
                              //Taille des contenus (boxs) des tickets
                              crossAxisSpacing: 10.0,
                            ),
                            /* itemBuilder: (context, indexx) =>
                                (ProductCard(product: demoProducts[indexx])), */
                                itemBuilder: (context, indexx) => 
                              Ticket_Card(
                                title: document.data()['nom'],
                                imageUrl: document.data()['images'],
                                price: "\$${document.data()['price']}",
                                productId: document.id,
                              )),
                            /* (TicketCard(
                            width: 130,
                            aspectRetio: 1.02,
                            product: demoProducts[index],
                          )), */
                          ),
                        );
                      } else if (index == 1) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          //padding: EdgeInsets.only(top: 20),
                          height: 1500,
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: TelProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 15.0,
                              //Taille des contenus (boxs) des tickets
                              crossAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, indexx) =>
                                (ProductCard(product: TelProducts[indexx])),
                            /* (TicketCard(
                            width: 130,
                            aspectRetio: 1.02,
                            product: demoProducts[index],
                          )), */
                          ),
                        );
                      } else if (index == 2) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          //padding: EdgeInsets.only(top: 20),
                          height: 1500,
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: TransportProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 15.0,
                              //Taille des contenus (boxs) des tickets
                              crossAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, indexx) => (ProductCard(
                                product: TransportProducts[indexx])),
                            /* (TicketCard(
                            width: 130,
                            aspectRetio: 1.02,
                            product: demoProducts[index],
                          )), */
                          ),
                        );
                      } else {
                        return null;
                      }
                    },
                    itemCount: list_name.length,
                  );
                },
                itemCount: list_name.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */