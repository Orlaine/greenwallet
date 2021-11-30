import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/default_button.dart';
import 'package:green_wallet/services/firebase_services.dart';
import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  DetailsScreen({Key key, @required this.product, @required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

FirebaseServices _firebaseServices = FirebaseServices();

final FirebaseFirestore firestore = FirebaseFirestore.instance;

/* Future _addToCart() {
  Future<int> Wallet = _firebaseServices.getWallet();
  return _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).update({
    "panier": {"test": 60, "title": "titre"}
  }).then((_) {
    //if (Wallet > 0) {
    print(Wallet);
    //}
  });
} */

/* getWallet() async {
  //await Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  if (_auth.currentUser != null) {
    final variable =
        await _firebaseServices.usersRef.doc(_auth.currentUser.uid).get();
    return variable['wallet'];
  } else {
    return null;
  }
} */

Future<int> getCoin() async {
  //await Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  if (_auth.currentUser != null) {
    final variable =
        await firestore.collection('clients').doc(_auth.currentUser.uid).get();
    int wallet = variable['wallet'];
    print(
        '***************<<<<<<<<<<<<<<<<<<$wallet>>>>>>>>>>>>>>>>>>*************');
    return wallet;
  } else {
    return null;
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  //Product get product => product;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    _addToCart() async {
      //getCoin();

      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      if (_auth.currentUser != null) {
        final variable = await firestore
            .collection('clients')
            .doc(_auth.currentUser.uid)
            .get();
        int wallet = int.parse(variable['wallet']);
        print(
            '***************<<<<<<<<<<<<<<<<<<$wallet>>>>>>>>>>>>>>>>>>*************');

        /******** */

        //********/

        return _firebaseServices.usersRef
            .doc(_firebaseServices.getUserId())
            .update({
          /*  "panier"[agrs.product.id]: {
          "title": agrs.product.title,
          "prix": agrs.product.price,
          "image": agrs.product.images[0],
          "description": agrs.product.description
        } */
          "panier": FieldValue.arrayUnion([
            {
              "title": agrs.product.title,
              "prix": agrs.product.price,
              "image": agrs.product.images[0],
              "description": agrs.product.description
            }
          ])
        }).then((isCalculated) {
          if (agrs.product.price <= wallet) {
            int ancien = agrs.product.price;
            int New = wallet - ancien;

            _firebaseServices.usersRef
                .doc(_firebaseServices.getUserId())
                .update({"wallet": "$New"});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Votre achat a été effectué avec succès'),
              ),
            );
          }
          if (agrs.product.price > wallet) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Vous n\'avez pas assez de coins pour effectuer cet achat'),
              ),
            );
          }
        });
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 55),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(190),
          child: DefaultButton(
            text: "Acheter le ticket",
            /* press: () {
              _addToCart(product);
            }, */
            press: () {
              _addToCart();
              //Scaffold.of(context).showSnackBar(_snackBar);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
} 

/* import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_bottom_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
 */

/* import 'package:flutter/material.dart';
import 'package:green_wallet/services/firebase_services.dart';
import 'package:green_wallet/widgets/image_swipe.dart';

import '../../constants copy.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  final String productId;
  DetailsScreen({@required this.productId});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
                List productSizes = documentData['size'];

                // Set an initial size
                _selectedProductSize = productSizes[0];

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
                        "${documentData['name']}",
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
          /* CustomActionBar(
            hasBackArrrow: true,
            hasTitle: false,
            hasBackground: false,
          ) */
        ],
      ),
    );
  }
}
 */