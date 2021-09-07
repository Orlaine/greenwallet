import 'package:flutter/widgets.dart';
import 'package:green_wallet/screens/buy/buy_screen.dart';
import 'package:green_wallet/screens/cart/cart_screen.dart';
import 'package:green_wallet/screens/codeqr/generateqr.dart';
import 'package:green_wallet/screens/complete_profile/complete_profile_screen.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:green_wallet/screens/forgot_password/forgot_password_screen.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/login_success/login_success_screen.dart';
import 'package:green_wallet/screens/map/map_screen.dart';
import 'package:green_wallet/screens/otp/otp_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';
import 'package:green_wallet/screens/sign_in/sign_in_screen.dart';
import 'package:green_wallet/screens/splash/splash_screen.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/tickets/home_ticket_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(
        onProductAdd: () {},
        product: null,
      ),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  GMapScreen.routeName: (context) => GMapScreen(),
  BankScreen.routeName: (context) => BankScreen(),
  BuyScreen.routeName: (context) => BuyScreen(),
  GenerateQR.routeName: (context) => GenerateQR(),
  HomeTicketScreen.routeName: (context) => HomeTicketScreen(),
};
