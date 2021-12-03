import 'package:flutter/material.dart';
import 'package:green_wallet/models/Actuality.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ActuDescription extends StatelessWidget {
  const ActuDescription({
    Key key,
    @required this.actuality,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Actuality actuality;
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
            actuality.title,
            style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
            //style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30),
            right: getProportionateScreenWidth(24),
          ),
          child: Text(
            actuality.content,
            //maxLines: 5,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
