import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final String category;
  final List<String> images;
  final int rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.category,
    @required this.images,
    this.rating = 0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/produits/achat1.jpg",
/*       "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png", */
    ],
    title: "Bon d'achat Online",
    price: 10,
    description:
        'Achetez des produits en ligne en toute sécurité dans notre nouvelle boutique online. Ce ticket vous donne droit à 5000 francs d\'achats, valide pendant 5 jours. Alors, n\'hésitez plus! ',
    rating: 4,
    category: "achat",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      //"assets/images/Image Popular Product 2.png",
      "assets/produits/Forfait2.jpg",
    ],
    title: "Internet illimités",
    price: 50,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours d'internet illimité en 4G au prix de rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "forfait",
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/produits/Alimentation2.jpg",
    ],
    title: "Epicerie",
    price: 36,
    description:
        "Quoi de mieux que des produit bios, frais et disponible. La compagnie GreenEat vous offre un pack de une bouteille d\huile d\olive, une bouteille d\eau et plein d'autres surprises au prix de presque rien. Alos, qu\'attendez vous pour collecter?",
    rating: 4,
    category: "bonachat",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/produits/Forfait4.jpg",
    ],
    title: "Messages illimités",
    price: 20,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours de messages illimités au prix de presque rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "forfait",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/produits/allimentation1.jpg",
    ],
    title: "Pack alimentation",
    price: 200,
    description:
        'Le pack-découverte conçut par la jeune entreprise GreenEat est constitué de plusieurs produits bio cultivées sans engrais tels que des tomates, des oignons des chous et pleins d\'autres surprises ',
    rating: 4,
    category: "alimentation",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/produits/Transport1.jpg",
    ],
    title: "Tickets de bus",
    price: 50,
    description:
        "L'entreprise GreenTrans vous offre des tickets de transport d'une valeur de 10000 Francs valables 2 mois en échange d'un geste fait pour l'environnement. Alors, soyez Green!",
    rating: 4,
    category: "transport",
    isPopular: false,
  ),
];
List<Product> TelProducts = [
  Product(
    id: 1,
    images: [
      //"assets/images/Image Popular Product 2.png",
      "assets/produits/Forfait3.jpg",
    ],
    title: "Internet illimités",
    price: 50,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours d'internet illimité en 4G au prix de rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "forfait",
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/produits/Forfait1.jpg",
    ],
    title: "Messages illimités",
    price: 12,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours de messages illimités au prix de presque rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "forfait",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/produits/Forfait2.jpg",
    ],
    title: "Internet haut débit",
    price: 50,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours d'internet illimité en 4G au prix de rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "telephone",
    isPopular: false,
  ),
  Product(
    id: 4,
    images: [
      "assets/produits/Forfait4.jpg",
    ],
    title: "Messages illimités",
    price: 50,
    description:
        "Votre opérateur de téléphonie mobile préféré GreenMobile vous offre 7jours de messages illimités au prix de presque rien. Il vous suffit de collecter des bouteilles, et le monde est à vous, alors, qu\'attendez-vous?",
    rating: 4,
    category: "telephone",
    isPopular: false,
  ),
];
List<Product> TransportProducts = [
  Product(
    id: 1,
    images: [
      "assets/produits/transport5.jpg",
    ],
    title: "Tickets de bus",
    price: 50,
    description:
        "L'entreprise GreenTrans vous offre des tickets de transport d'une valeur de 10000 Francs valables 2 mois en échange d'un geste fait pour l'environnement. Alors, soyez Green!",
    rating: 4,
    category: "transport",
    isPopular: false,
  ),
  Product(
    id: 2,
    images: [
      "assets/produits/Transport1.jpg",
    ],
    title: "Ticket de bus",
    price: 15,
    description:
        "Déplacez vous en toute sécurité dans la ville et profitez de notre offre exceptionnelle qui vous permet d'effectuer 10 déplacements. Ne tardez pas, et surtout, soyez Greens!",
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/produits/transport3.jpg",
    ],
    title: "Billet d'avion",
    price: 12,
    description:
        "La compagnie GreenAir vous propose des billets d'avion pour des trajets de moins de 4 heures, au prix de quelques bouteilles collectées. Alors n'hésitez plus!",
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/produits/Transport4.jpg",
    ],
    title: "Bons d'essence",
    price: 12,
    description:
        "La compagnie GreenOil vous propose un carnet de bons de carburants d'une valeur de 5000 Francs valable dans toutes ses stations localisées sur le territoire Camerounais. Alors, n'hésitez plus!",
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
];

List<Product> AchatProducts = [
  Product(
    id: 1,
    images: [
      "assets/produits/achat1.jpg",
    ],
    title: "Bon d'achat online",
    price: 50,
    description:
        'Achetez des produits en ligne en toute sécurité dans notre nouvelle boutique online. Ce ticket vous donne droit à 5000 francs d\'achats, valide pendant 5 jours. Alors, n\'hésitez plus! ',
    rating: 4,
    category: "transport",
    isPopular: false,
  ),
  Product(
    id: 2,
    images: [
      "assets/produits/achat2.jpg",
    ],
    title: "E-achat",
    price: 15,
    description:
        'Achetez des produits en ligne en toute sécurité dans notre nouvelle boutique online. Ce ticket vous donne droit à 5000 francs d\'achats, valide pendant 5 jours. Alors, n\'hésitez plus! ',
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/produits/achat3.jpg",
    ],
    title: "Bon de Supermarché",
    price: 12,
    description:
        'Achetez des produits d\'une valeur de 100000 Francs  dans nos supermarchés et ce en toute confiance sur la qualité des produits.Ce ticket est valide pendant 5 jours. Alors, n\'hésitez plus! ',
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/produits/allimentation1.jpg",
    ],
    title: "Achat Légumes",
    price: 12,
    description:
        'Le pack-découverte conçut par la jeune entreprise GreenEat est constitué de plusieurs produits bio cultivées sans engrais tels que des tomates, des oignons des chous et pleins d\'autres surprises ',
    rating: 4,
    category: "transport",
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Ce ticket vous donne droit à un forfait d'appel téléphonique de xx jours avec xx garantie de XX temps...";
