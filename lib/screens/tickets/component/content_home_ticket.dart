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
  List list_name = ["Tout", "Forfait", "Transport", "Achats"];
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
            Container(
                padding: EdgeInsets.only(top: 40),
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
                  /* return new Swiper(
                    duration: 2,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) { */
                  //return buildForYouContainers();
                  /* return Container(
                    margin: EdgeInsets.only(top: 20),
                    //padding: EdgeInsets.only(top: 20),
                    height: 1500,
                    width: double.infinity,
                    //color: Colors.blue,
                    child: GridView.builder(
                      itemCount: demoProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 15.0,
                        //Taille des contenus (boxs) des tickets
                        crossAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) => (TicketCard(
                        width: 130,
                        aspectRetio: 1.02,
                        product: demoProducts[index],
                      )),
                    ),
                  ); */
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      //padding: EdgeInsets.only(top: 20),
                      height: 1500,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: demoProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 15.0,
                          //Taille des contenus (boxs) des tickets
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, indexx) =>
                            (ProductCard(product: TransportProducts[indexx])),
                        /* (TicketCard(
                            width: 130,
                            aspectRetio: 1.02,
                            product: demoProducts[index],
                          )), */
                      ),
                    );
                  } else if (index == 3) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      //padding: EdgeInsets.only(top: 20),
                      height: 1500,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: AchatProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 15.0,
                          //Taille des contenus (boxs) des tickets
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, indexx) =>
                            (ProductCard(product: AchatProducts[indexx])),
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

                  /*return SingleChildScrollView(
                      child:
                          buildTicketContainers() 
                          /* VisibilityDetector(
                      key: Key(index.toString()),
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 1500,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                list_name[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ],
                          )),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction == 1)
                          setState(() {
                            selectedIndex = index;
                            tabController.animateTo(index);
                            currentindex2 = index;
                            print(index);
                          });
                      },
                    ), */
                      );
                  /* VisibilityDetector(
                    key: Key(index.toString()),
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 1500,
                        width: double.infinity,
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              list_name[index],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        )),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction == 1)
                        setState(() {
                          selectedIndex = index;
                          tabController.animateTo(index);
                          currentindex2 = index;
                          print(index);
                        });
                    },
                  ); */
                  //},
                  //itemCount: list_name.length,
                  //);
*/
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


/* import 'package:flutter/material.dart';
import 'package:green_wallet/services/firebase_services.dart';
import 'package:green_wallet/widgets/custom_action_bar.dart';
import 'package:green_wallet/widgets/image_swipe.dart';
import 'package:green_wallet/widgets/product_size.dart';

import '../../../constants copy.dart';

class ContentHomeTicketScreen extends StatefulWidget {
  final String productId;
  ContentHomeTicketScreen({this.productId});

  @override
  _ContentHomeTicketScreenState createState() =>
      _ContentHomeTicketScreenState();
}

class _ContentHomeTicketScreenState extends State<ContentHomeTicketScreen> {
  FirebaseServices _firebaseServices = FirebaseServices();
  String _selectedProductSize = "0";

  Future _addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({"size": _selectedProductSize});
  }

  Future _addToSaved() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Saved")
        .doc(widget.productId)
        .set({"size": _selectedProductSize});
  }

  final SnackBar _snackBar = SnackBar(
    content: Text("Product added to the cart"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                // Firebase Document Data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                // List of images
                List imageList = documentData['images'];
                //List productSizes = documentData['size'];

                // Set an initial size
                //_selectedProductSize = productSizes[0];

                return ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ImageSwipe(
                      imageList: imageList,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        "${documentData['nom']}",
                        style: Constants.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "\$${documentData['price']}",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "${documentData['desc']}",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Select Size",
                        style: Constants.regularDarkText,
                      ),
                    ),
                    /* ProductSize(
                      productSizes: productSizes,
                      onSelected: (size) {
                        _selectedProductSize = size;
                      },
                    ), */
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await _addToSaved();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            child: Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFDCDCDC),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                  "assets/images/tab_saved.png",
                                ),
                                height: 22.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await _addToCart();
                                Scaffold.of(context).showSnackBar(_snackBar);
                              },
                              child: Container(
                                height: 65.0,
                                margin: EdgeInsets.only(
                                  left: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            hasBackArrrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
} */

/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/tickets/component/ticket_container.dart';
import 'package:green_wallet/widgets/custom_action_bar.dart';
import 'package:green_wallet/widgets/product_card.dart';

class ContentHomeTicketScreen extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 108.0,
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return Ticket_Card(
                      title: document.data()['nom'],
                      imageUrl: document.data()['images'],
                      price: "\$${document.data()['price']}",
                      productId: document.id,
                    );
                    /* return ProductCard(
                      product: demoProducts[1],
                      press: () {},
                    ); */
                  }).toList(),
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          /* CustomActionBar(
            title: "Home",
            hasBackArrrow: false,
          ), */
        ],
      ),
    );
  }
} */

/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/product_card.dart';
import 'package:green_wallet/models/Product.dart';
import 'package:green_wallet/screens/tickets/component/ticket_container.dart';
import 'package:green_wallet/widgets/custom_action_bar.dart';
import 'package:green_wallet/widgets/product_card.dart';

class ContentHomeTicketScreen extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 108.0,
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      //padding: EdgeInsets.only(top: 20),
                      height: 1500,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: TransportProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 15.0,
                          //Taille des contenus (boxs) des tickets
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, indexx) => Ticket_Card(
                          title: document.data()['nom'],
                          imageUrl: document.data()['images'],
                          price: "\$${document.data()['price']}",
                          productId: document.id,
                        ),
                      ),
                    );
                    /* return ProductCard(
                      product: demoProducts[1],
                      press: () {},
                    ); */
                  }).toList(),
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          /* CustomActionBar(
            title: "Home",
            hasBackArrrow: false,
          ), */
        ],
      ),
    );
  }
}
 */