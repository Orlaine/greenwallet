/* import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../enums.dart';
import 'actu_container.dart';
import 'container.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class HomeActuScreen extends StatefulWidget {
  static String routeName = "/homeactu";
  @override
  _HomeActuScreenState createState() => _HomeActuScreenState();
}

class _HomeActuScreenState extends State<HomeActuScreen>
    with SingleTickerProviderStateMixin {
  List list_name = ["Most Selling", "HamBurger", "Pizza", "Chikcen", "Eggs"];
  SwiperController _scrollController = new SwiperController();
  TabController tabController;
  int currentindex2 = 0; // for swiper index initial
  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
  }

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

  Widget buildAstuces() {
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
    //final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: list_name.length,
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40),
                  height: 70,
                  child: DefaultTabController(
                    length: list_name.length,
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 35.0),
                      child: Material(
                        child: TabBar(
                          onTap: (index) => _scrollController.move(index),
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontSize: 12),
                          unselectedLabelColor: Colors.black,
                          tabs: List<Widget>.generate(list_name.length,
                              (int index) {
                            return new Tab(text: list_name[index]);
                          }),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: new Swiper(
                  onIndexChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                      tabController.animateTo(index);
                      currentindex2 = index;
                      print(index);
                    });
                  },
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      tabController.animateTo(index);
                      currentindex2 = index;
                      print(index);
                    });
                  },
                  duration: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return new Swiper(
                      duration: 2,
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return VisibilityDetector(
                          key: Key(index.toString()),
                          child: Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 500,
                              width: double.infinity,
                              color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    list_name[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ],
                              )),
                          onVisibilityChanged: (VisibilityInfo info) {
                            if (info.visibleFraction == 1)
                              setState(() {
                                selectedIndex = index;
                                tabController.animateTo(index);
                                currentindex2 = index;
                                print(index);
                              });
                          },
                        );
                      },
                      itemCount: list_name.length,
                    );
                  },
                  itemCount: list_name.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';

import '../../../enums.dart';
import 'actu_container.dart';
import 'container.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class HomeActuScreen extends StatefulWidget {
  static String routeName = "/homeactu";
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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.homeactu),
      //bottomNavigationBar: BottomBar(selectedMenu: MenuState.homeactu),
    );
  }
}
 */ */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:green_wallet/components/actu_card.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../enums.dart';
import 'actu_container.dart';
import 'container.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ContentHomeActuScreen extends StatefulWidget {
  //static String routeName = "/homeactu";
  @override
  _ContentHomeActuScreenState createState() => _ContentHomeActuScreenState();
}

class _ContentHomeActuScreenState extends State<ContentHomeActuScreen>
    with SingleTickerProviderStateMixin {
  List list_name = ["Astuces GreenPlan", "Sensibilisation", "Autre"];
  SwiperController _scrollController = new SwiperController();
  TabController tabController;
  Actuality actuality;
  int currentindex2 = 0; // for swiper index initial
  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
  }

  Widget buildActualityContainers() {
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
    //final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: list_name.length,
      child: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 40),
                height: 70,
                child: DefaultTabController(
                  length: list_name.length,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 35.0),
                    child: Material(
                      child: TabBar(
                        onTap: (index) => _scrollController.move(index),
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 12),
                        unselectedLabelColor: Colors.black,
                        tabs: List<Widget>.generate(list_name.length,
                            (int index) {
                          return new Tab(text: list_name[index]);
                        }),
                      ),
                    ),
                  ),
                )),
            /* SizedBox(
              height: 5,
            ), */
            Expanded(
              child: new Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;
                    print(index);
                  });
                },
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;
                    print(index);
                  });
                },
                duration: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    /* return Container(
                      //margin: EdgeInsets.only(top: 20),
                      ///padding: EdgeInsets.only(top: 20),
                      //height: 1500,
                      //width: double.infinity,
                      child: GridView.builder(
                        itemCount: demoActuality.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          //Taille des contenus (boxs) des tickets
                          //crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, indexx) =>
                            (ActuCard(actuality: demoActuality[indexx])),
                      ),
                    ); */
                    return Container(
                      //margin: EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemCount: demoActuality.length,
                        itemBuilder: (BuildContext context, int indexx) =>
                            (ActuCard(actuality: demoActuality[indexx])),
                      ),
                    );
                  } else if (index == 1) {
                    return Container(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemCount: sensibilisation.length,
                        itemBuilder: (BuildContext context, int indexx) =>
                            (ActuCard(actuality: sensibilisation[indexx])),
                      ),
                    );
                  } else if (index == 2) {
                    return Container(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemCount: autres.length,
                        itemBuilder: (BuildContext context, int indexx) =>
                            (ActuCard(actuality: autres[indexx])),
                      ),
                    );
                  } else {
                    return null;
                  }
                },
                itemCount: list_name.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/* 
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:green_wallet/components/bottom_bar.dart';
import 'package:green_wallet/components/coustom_bottom_nav_bar.dart';
//import 'package:googlenews/Data/data.dart';
//import 'package:googlenews/Widgets/ForYouContainer.dart';
//import 'package:googlenews/Widgets/TrendingContainer.dart';
import 'package:green_wallet/models/Actuality.dart';
import 'package:green_wallet/screens/details/components/custom_app_bar.dart';
import 'package:green_wallet/screens/details/details_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../enums.dart';
import 'actu_container.dart';
import 'container.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ContentHomeActuScreen extends StatefulWidget {
  //static String routeName = "/homeactu";
  @override
  _ContentHomeActuScreenState createState() => _ContentHomeActuScreenState();
}

class _ContentHomeActuScreenState extends State<ContentHomeActuScreen>
    with SingleTickerProviderStateMixin {
  List list_name = ["Astuces GreenPlan", "Sensibilisation", "Autre"];
  SwiperController _scrollController = new SwiperController();
  TabController tabController;
  Actuality actuality;
  int currentindex2 = 0; // for swiper index initial
  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
  }

    Widget buildActualityContainers() {
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

  Widget buildAstuces() {
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
    //final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: list_name.length,
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40),
                  height: 70,
                  child: DefaultTabController(
                    length: list_name.length,
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 35.0),
                      child: Material(
                        child: TabBar(
                          onTap: (index) => _scrollController.move(index),
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontSize: 12),
                          unselectedLabelColor: Colors.black,
                          tabs: List<Widget>.generate(list_name.length,
                              (int index) {
                            return new Tab(text: list_name[index]);
                          }),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: new Swiper(
                  onIndexChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                      tabController.animateTo(index);
                      currentindex2 = index;
                      print(index);
                    });
                  },
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      tabController.animateTo(index);
                      currentindex2 = index;
                      print(index);
                    });
                  },
                  duration: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return new Swiper(
                      duration: 2,
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return VisibilityDetector(
                          key: Key(index.toString()),
                          child: Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 500,
                              width: double.infinity,
                              color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    list_name[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ],
                              )),
                          onVisibilityChanged: (VisibilityInfo info) {
                            if (info.visibleFraction == 1)
                              setState(() {
                                selectedIndex = index;
                                tabController.animateTo(index);
                                currentindex2 = index;
                                print(index);
                              });
                          },
                        );
                      },
                      itemCount: list_name.length,
                    );
                  },
                  itemCount: list_name.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */