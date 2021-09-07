import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/components/product_card.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
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
                            itemBuilder: (context, indexx) =>
                                (ProductCard(product: demoProducts[indexx])),
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
