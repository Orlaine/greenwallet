/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/buy/buy_screen.dart';
import 'package:green_wallet/screens/codeqr/generateqr.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/map/map_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../enums.dart';
import 'fab_bottom_appbar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.add),
            elevation: 2.0,
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: FABBottomAppBar(
            items: [
              FABBottomAppBarItem(
                iconData: Icons.home,
                text: 'Acceuil',
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                //onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              FABBottomAppBarItem(
                iconData: Icons.payment,
                text: 'Acheter',
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                //onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              FABBottomAppBarItem(
                iconData: Icons.map,
                text: 'Carte',
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                //onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              FABBottomAppBarItem(
                iconData: Icons.local_activity,
                text: 'Actualités',
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                //onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
              ),
            ],
            selectedColor: kPrimaryColor,
            color: Colors.grey,
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, HomeScreen.routeName);
                  break;
                case 1:
                  Navigator.pushNamed(context, BuyScreen.routeName);
                  break;
                case 2:
                  Navigator.pushNamed(context, GMapScreen.routeName);
                  break;
                case 3:
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                  break;
              }
            },
          )),
    );
  }
} */

/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/codeqr/generateqr.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              /* IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                onPressed: () {},
              ), */
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: MenuState.bank == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, GenerateQR.routeName);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.monetization_on_outlined,
                  color: MenuState.bank == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, BankScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:green_wallet/screens/actuality/actu_screen.dart';
import 'package:green_wallet/screens/codeqr/generateqr.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/map/map_screen.dart';
import 'package:green_wallet/screens/tickets/home_ticket_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: MenuState.home == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                        //size: widget.iconSize
                      ),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      //iconSize: 24,
                      onPressed: () =>
                          Navigator.pushNamed(context, HomeScreen.routeName),
                    ),
                    Text(
                      'Accueil',
                      style: TextStyle(
                        color: MenuState.home == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                    )
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.payment,
                        color: MenuState.home_ticket == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, HomeTicketScreen.routeName);
                      },
                    ),
                    Text(
                      'Acheter',
                      style: TextStyle(
                        color: MenuState.bank == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                    ),
                  ]),
              /* IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                onPressed: () {},
              ), */
              FloatingActionButton(
                backgroundColor: kPrimaryColor,
                //child: Icon(Icons.add),
                child: Icon(Icons.filter_center_focus_outlined),
                elevation: 2.0,
                onPressed: () {
                  Navigator.pushNamed(context, GenerateQR.routeName);
                },
              ),
              /* IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: MenuState.bank == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, GenerateQR.routeName);
                },
              ), */
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.map,
                        color: MenuState.gmap == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, GMapScreen.routeName);
                      },
                    ),
                    Text(
                      'Carte',
                      style: TextStyle(
                        color: MenuState.gmap == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                    ),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.connected_tv_outlined,
                          color: MenuState.homeactu == selectedMenu
                              ? kPrimaryColor
                              : inActiveIconColor,
                        ),
                        onPressed: () => {
                              Navigator.pushNamed(
                                  context, HomeActuScreen.routeName),
                            }),
                    Text(
                      'Actualités',
                      style: TextStyle(
                        color: MenuState.homeactu == selectedMenu
                            ? kPrimaryColor
                            : inActiveIconColor,
                      ),
                    ),
                  ]),
            ],
          )),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_wallet/screens/bank_account/bank_screen.dart';
import 'package:green_wallet/screens/codeqr/generateqr.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              /* IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                onPressed: () {},
              ), */
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: MenuState.bank == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, GenerateQR.routeName);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.monetization_on_outlined,
                  color: MenuState.bank == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, BankScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
 */ 