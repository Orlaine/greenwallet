import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(110)),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        /* Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
                  product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ), */
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30),
            right: getProportionateScreenWidth(24),
          ),
          child: Text(
            product.description,
            maxLines: 5,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: 10,
          ),
          child: Row(
            //GestureDetector(
            //  onTap: () {},
            //  child: Row(
            children: [
              Text(
                "Prix:",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              Text(
                "  ${product.price} coins",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: kSecondaryColor),
              ),
              SizedBox(width: 5),
            ],
          ),
          //),
        ),
        SizedBox(height: getProportionateScreenHeight(2)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: 10,
          ),
          child: Row(
            children: [
              Text(
                "Validité:",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              Text(
                //Insérer la validité en base de données
                "  38 heures",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: kSecondaryColor),
              ),
              SizedBox(width: 5),
            ],
          ),
        )
      ],
    );
  }
}
