import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final String category;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.category,
    @required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/bus.png",
/*       "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png", */
    ],
    title: "Ticket de bus",
    price: 100,
    description: description,
    rating: 4.8,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      //"assets/images/Image Popular Product 2.png",
      "assets/images/jackbower.png",
    ],
    title: "Appels illimités",
    price: 50,
    description: description,
    rating: 4.1,
    category: "telephone",
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/bon_achat.png",
    ],
    title: "Bon d'achat",
    price: 36,
    description: description,
    rating: 4.1,
    category: "bonachat",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/fuel.png",
    ],
    title: "Bon de carburant",
    price: 200,
    description: description,
    rating: 4.1,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/wallet_home.png",
    ],
    title: "Forfait",
    price: 200,
    description: description,
    rating: 4.1,
    category: "telephone",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    title: "Un test",
    price: 50,
    description: description,
    rating: 4.1,
    category: "telephone",
    isPopular: false,
  ),
];
List<Product> TelProducts = [
  Product(
    id: 2,
    images: [
      //"assets/images/Image Popular Product 2.png",
      "assets/images/jackbower.png",
    ],
    title: "Appels illimités",
    price: 50,
    description: description,
    rating: 4.1,
    category: "telephone",
    isPopular: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/wallet_home.png",
    ],
    title: "Forfait",
    price: 200,
    description: description,
    rating: 4.1,
    category: "telephone",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    title: "Un test",
    price: 50,
    description: description,
    rating: 4.1,
    category: "telephone",
    isPopular: false,
  ),
];
List<Product> TransportProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/bus.png",
/*       "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png", */
    ],
    title: "Ticket de bus",
    price: 100,
    description: description,
    rating: 4.8,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/fuel.png",
    ],
    title: "Bon de carburant",
    price: 200,
    description: description,
    rating: 4.1,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Ce ticket vous donne droit à un forfait d'appel téléphonique de xx jours avec xx garantie de XX temps...";
