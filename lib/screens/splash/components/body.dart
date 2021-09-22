import 'package:flutter/material.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/login_success/login_success_screen.dart';
import 'package:green_wallet/screens/splash/components/background.dart';
import 'package:green_wallet/components/rounded_button.dart';
import 'package:green_wallet/constants.dart';
import 'package:green_wallet/screens/sign_in/sign_in_screen.dart';
import 'package:green_wallet/screens/sign_up/sign_up_screen.dart';
import 'package:green_wallet/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GREEN WALLET",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(26),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              /* "assets/images/wallet2.png", */
              "assets/images/wallets.png",
              height: size.height * 0.45,
              /* height: getProportionateScreenHeight(265),
              width: getProportionateScreenWidth(235), */
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "CONNEXION",
              press: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                //Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            RoundedButton(
              text: "INSCRIPTION",
              press: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Let's make it real!", "image": "assets/images/splash1.png"},
    {
      "text": "Let's make our planet greet again!",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
 */