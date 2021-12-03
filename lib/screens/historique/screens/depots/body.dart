import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_wallet/constants.dart';
import 'package:green_wallet/models/Cart.dart';
import 'package:green_wallet/screens/cart/components/cart_card.dart';

import '../../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var listDep = fetchDep();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Depot>>(
      future: listDep,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if ((snapshot.data).length == 0) {
            return Center(child: Text("Vous n'avez effectué aucun dépot"));
          }
          print("il ya des données");
          return ListView.separated(
              itemBuilder: (context, index) {
                final Depot depot = (snapshot.data)[index];
                //var depot = (snapshot.data)[index];
                if (depot.type == 'depot') {}
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
                      ListItemContainer(depot: depot),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ClipPath(
                          clipper: ArcClipper(),
                          child: Container(
                            color: kPrimaryColor.withOpacity(.5),
                            width: MediaQuery.of(context).size.width * .28,
                          ),
                        ),
                      )
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

class Depot {
  String type;
  Infos infos;
  Machine machine;
  Depot({this.type, this.infos, this.machine});

  factory Depot.fromJSON(Map<String, dynamic> parsedJson) {
    return Depot(
      type: parsedJson['type'],
      infos: Infos.fromJSON(parsedJson['info']),
      machine: Machine.fromJSON(parsedJson['machine']),
    );
  }
}

class Infos {
  int qte;
  Infos({this.qte});

  factory Infos.fromJSON(Map<String, dynamic> parsedJson) {
    return Infos(
      qte: parsedJson['nb_bte'],
    );
  }
}

class Machine {
  String nom;
  Localite localite;

  Machine({this.nom, this.localite});

  factory Machine.fromJSON(Map<String, dynamic> parsedJson) {
    return Machine(
      nom: parsedJson['nom'],
      localite: Localite.fromJSON(parsedJson['localite']),
    );
  }
}

class Localite {
  String ville, quartier;

  Localite({this.ville, this.quartier});

  factory Localite.fromJSON(Map<String, dynamic> parsedJson) {
    return Localite(
      ville: parsedJson['ville'],
      quartier: parsedJson['quartier'],
    );
  }
}

Future<List<Depot>> fetchDep() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  Response response = await Dio().get(
      'https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/${auth.currentUser.uid}');
  //.get('https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/R4VzenEsNqXdonEkskMpojGJMNI3');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var getData = response.data['data']['transactions'] as List;
    return getData.map((i) => Depot.fromJSON(i)).toList();
    //return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ListItemContainer extends StatelessWidget {
  const ListItemContainer({
    Key key,
    this.depot,
  }) : super(key: key);

  final Depot depot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Icon(Icons.add_circle, color: kPrimaryColor),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DETAILS DU DEPOT',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Dépot effectué dans la machine nomée ${depot.machine.nom} située dans la ville de ${depot.machine.localite.ville}, au quartier ${depot.machine.localite.quartier}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  '      + ${depot.infos.qte}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "        Bouteilles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
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
