import 'package:flutter/material.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ActuImages extends StatefulWidget {
  const ActuImages({
    Key key,
    @required this.actuality,
  }) : super(key: key);

  final Actuality actuality;

  @override
  _ActuImagesState createState() => _ActuImagesState();
}

class _ActuImagesState extends State<ActuImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(138),
          child: AspectRatio(
            aspectRatio: 0.9,
            child: Hero(
              tag: widget.actuality.id.toString(),
              child: Image.asset(widget.actuality.images[selectedImage]),
            ),
          ),
        ),
      ],
    );
  }
}
