import 'package:flutter/material.dart';
import 'package:green_wallet/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    print("Test2");
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification du Téléphone"),
      ),
      body: Body(),
    );
  }
}
