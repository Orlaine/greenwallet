/* import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_wallet/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}
 */

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_wallet/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var listDep = fetchDep();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Achats>>(
      future: listDep,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if ((snapshot.data).length == 0) {
            return Center(child: Text("Vous n'avez effectué aucun achat"));
          }
          print("il ya des données");
          return ListView.separated(
              itemBuilder: (context, index) {
                final Achats achat = (snapshot.data)[index];
                //var depot = (snapshot.data)[index];
                //if (achat.type == 'depot') {}
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  height: MediaQuery.of(context).size.height * .18,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    color: Color(0xFFebfee4),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xe2e8e0).withOpacity(.4),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(10, 5),
                      )
                    ],
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ListItemContainer(achat: achat),
                      /* Align(
                        alignment: Alignment.centerRight,
                        child: ClipPath(
                          clipper: ArcClipper(),
                          child: Container(
                            color: kPrimaryColor.withOpacity(.5),
                            width: MediaQuery.of(context).size.width * .28,
                          ),
                        ),
                      ) */
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: (snapshot.data).length);
        } else if (snapshot.hasError) {
          return Center(
              child:
                  //Text("${snapshot.error} est l'erreur")
                  Text("Erreur de chargement, veuillez actualiser la page"));
        }
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
        );
      },
    ));
  }
}

class Achats {
  String title;
  int prix;
  String image;
  String description;
  Achats({this.title, this.prix, this.image, this.description});

  factory Achats.fromJSON(Map<String, dynamic> parsedJson) {
    return Achats(
      title: parsedJson['title'],
      prix: parsedJson['prix'],
      image: parsedJson['image'],
      description: parsedJson['description'],
    );
  }
}

Future<List<Achats>> fetchDep() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  Response response = await Dio().get(
      'https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/${auth.currentUser.uid}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var getData = response.data['data']['panier'] as List;
    return getData.map((i) => Achats.fromJSON(i)).toList();
    //return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Erreur de chargement');
  }
}

class ListItemContainer extends StatelessWidget {
  const ListItemContainer({
    Key key,
    this.achat,
  }) : super(key: key);

  final Achats achat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Image.asset(achat.image),
          const SizedBox(width: 30),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achat.title,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  achat.description.substring(0, 50),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  ' Prix:  ${achat.prix} Coins',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 30, 0);
    path.quadraticBezierTo(3, size.height * .25, 0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
