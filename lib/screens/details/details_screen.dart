import 'package:flutter/material.dart';
import 'package:green_wallet/components/default_button.dart';
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
  const DetailsScreen(
      {Key key, @required this.product, @required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 55),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(190),
          child: DefaultButton(
            text: "Ajouter au panier",
            press: () {
              widget.onProductAdd();
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