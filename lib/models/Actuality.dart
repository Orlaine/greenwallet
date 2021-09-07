import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Actuality {
  final int id;
  final String title, content, images, categorie, authorImg, author;
  final DateFormat date;
  final bool isPopular;

  Actuality({
    @required this.id,
    @required this.images,
    @required this.content,
    @required this.categorie,
    @required this.author,
    this.authorImg,
    this.isPopular = false,
    @required this.title,
    @required this.date,
  });
}

// Our demo Products
final List<Actuality> trendingNews = [
  Actuality(
    id: 1,
    images: "assets/images/venice.jpg",
    title: "It has to stop",
    date: DateFormat('2000-01-30 15:50'),
    content:
        'Donald Trump has verbally attacked Michigan\'s governor Gretchen Whitmer, despite warnings about the effect his words can have.During a rally in the state, Mr Trump called on Ms Whitmer, a Democrat, to axe the remaining restrictions aimed at limiting the spread of the coronavirus.',
    categorie: "politics",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 1,
    images: "assets/images/venice.jpg",
    title: "It has to stop",
    date: DateFormat('2000-01-30 15:50'),
    content:
        'Jadon Sancho transfer rumors are growing as we move towards the winter break. Despite Borussia Dortmund’s fans’ feelings, big European clubs like Paris Saint-Germain, Real Madrid, Liverpool, and Manchester United are all interested in the services of the 19 years old English international.According to Marca.com, Real Madrid and Liverpool joined the race to sign the talented Borussia Dortmund player in the summer. Manchester United’s interest in the young forward is a little bit older.',
    categorie: "politics",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
];
List<Actuality> demoActuality = [
  Actuality(
    id: 1,
    images: "assets/images/venice.jpg",
    title: "Destination nouvelle !",
    date: DateFormat('2000-01-30 15:50'),
    content: description,
    categorie: "astuce",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 2,
    images: "assets/images/jackbower.png",
    title: "Appels illimités",
    date: DateFormat('2000-01-30 15:50'),
    content: description,
    categorie: "astuce",
    author: 'Sky News',
    isPopular: true,
  ),
  Actuality(
    id: 3,
    images: "assets/images/bon_achat.png",
    title: "Bon d'achat",
    date: DateFormat('2000-01-30 15:50'),
    content: description,
    categorie: "soldes",
    author: 'Sky News',
    isPopular: true,
  ),
  Actuality(
    id: 4,
    images: "assets/images/bon_achat.png",
    title: "Bon d'achat",
    date: DateFormat('2000-01-30 15:50'),
    content: description,
    categorie: "soldes",
    author: 'Carrefour',
    isPopular: true,
  ),
];

const String description =
    "Ce ticket vous donne droit à un forfait d'appel téléphonique de xx jours avec xx garantie de XX temps...";
