import 'package:flutter/material.dart';
import 'package:green_wallet/models/Actuality.dart';
import '../../size_config.dart';
import 'components/body_actu.dart';
import 'components/custom_app_bar.dart';

class DetailsActuScreen extends StatefulWidget {
  static String routeName = "/details_actu";
  DetailsActuScreen({Key key, @required this.actuality}) : super(key: key);

  final Actuality actuality;

  @override
  _DetailsActuScreenState createState() => _DetailsActuScreenState();
}

class _DetailsActuScreenState extends State<DetailsActuScreen> {
  //Product get product => product;

  @override
  Widget build(BuildContext context) {
    final ActuDetailsArguments agrs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 55),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(190),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CustomAppBar(rating: 0),
      body: BodyActu(actuality: agrs.actuality),
    );
  }
}

class ActuDetailsArguments {
  final Actuality actuality;

  ActuDetailsArguments({@required this.actuality});
}
