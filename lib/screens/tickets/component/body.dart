import 'package:flutter/material.dart';
import 'package:green_wallet/components/no_account_text.dart';
import 'package:green_wallet/screens/tickets/component/content_home_ticket.dart';
//import 'package:green_wallet/components/socal_card.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 122),
        child: Column(
          children: [
            /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Material(
                //elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ), */
            SizedBox(
              height: 20,
            ),
            ContentHomeTicketScreen(),
          ],
        ));
  }
}
