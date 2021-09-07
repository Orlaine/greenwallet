import 'package:flutter/material.dart';

class GreenBox {
  //final int id;
  //final String id, nom, latitude, longitude;
  //final Map<String,dynamic> coordonees;
  final String nom, id;
  //final List coordonees;

  GreenBox({
    @required this.id,
    //@required this.coordonees,
    //@required this.latitude,
    //@required this.longitude,
    @required this.nom,
  });
}

List<GreenBox> listBox = [
  GreenBox(
    id: "ChFFvCCKk6xBO4kQkYow",
    /* coordonees: {
      latitude: "4.0476624",
      longitude: "9.693887",
      },  */
    nom: "GreenBox-1",
  ),
];
