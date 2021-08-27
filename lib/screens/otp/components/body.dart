import 'package:flutter/material.dart';
import 'package:green_wallet/constants.dart';
import 'package:green_wallet/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Test3");
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Verification du Numéro",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              Text(
                  "Nous vous avons envoyé un code de \n      vérification au +237 698 87 ** **"),
              buildTimer(),
              OtpForm(
                phoneNumber: '',
                password: '',
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // code resend
                },
                child: Text(
                  "Envoyer un nouveau code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Ce code expire dans "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
