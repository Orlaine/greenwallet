import 'package:flutter/material.dart';
import 'package:green_wallet/components/app_header.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
import 'package:green_wallet/screens/tickets/component/body.dart';

import '../../enums.dart';
import 'component/content_home_ticket.dart';

class HomeTicketScreen extends StatelessWidget {
  static String routeName = "/home_ticket";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(head: "Acheter un ticket"),
      //body: Body(),
      body: ContentHomeTicketScreen(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.home_ticket),
    );
  }
}
