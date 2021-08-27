/* import 'package:flutter/material.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/actuality/components/actu_container.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';

import '../../../enums.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class HomeActuScreen extends StatefulWidget {
  static String routeName = "/homeservices";
  @override
  _HomeActuScreenState createState() => _HomeActuScreenState();
}

class _HomeActuScreenState extends State<HomeActuScreen> {
  Widget buildForYouContainers() {
    List<Widget> actuContainers = [];
    for (Actuality article in demoActuality) {
      actuContainers.add(ActuContainer(
        article: article,
      ));
    }

    return Column(
      children: actuContainers,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xfff4f6f9),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          //Entête page principale
          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.black,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 40,
                ),
              ],
            ),
          ), */
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5,
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
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: 5,
            child: TabBar(
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              isScrollable: true,

              /* indicator: MD2Indicator(
                indicatorHeight: 3,
                indicatorColor: Colors.blue,
                indicatorSize: MD2IndicatorSize.full,
              ), */
              tabs: [
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Sports',
                ),
                Tab(
                  text: 'Economy',
                ),
                Tab(
                  text: 'Fashion',
                ),
                Tab(
                  text: 'Entertainment',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 10,
          ),
          buildForYouContainers(),
        ],
      ),
      //appBar: CustomAppBar(rating: agrs.product.rating),
      //On ajoute la barre de navigation basse à l'écran
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.homeservices),
    );
  }
}
 */