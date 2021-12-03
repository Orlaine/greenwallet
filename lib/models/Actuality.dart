import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Actuality {
  final int id;
  final String title, content, categorie, authorImg, author;
  final List<String> images;
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
final List<Actuality> sensibilisation = [
  Actuality(
    id: 1,
    images: ["assets/produits/a1.jpg"],
    title: "It has to stop",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Au cours du recyclage, les matières premières déjà utilisées sont traitées et réutilisées. D'un autre côté, ce qu’on appelle la revalorisation des objets permet de continuer à utiliser des déchets ou des articles usagés en les transformant et en les améliorant pour un nouvel usage.Voici quelques-unes de ces idées pour les vêtements, les bouteilles en plastique ou le gel de silice que l’on trouve notamment dans les sacs, les chaussures ou les vestes neufs. ",
    categorie: "Sensibilisation",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 1,
    images: ["assets/produits/a2.png"],
    title: "Stop au vandalisme des bacs",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Oui. Il est interdit de jeter ou d'abandonner ses déchets dans la rue. De même, il est interdit de déposer ses déchets sans respecter les règles de collecte des déchets définies par la mairie (jour, horaires, tri). Dans les 2 cas, ne pas respecter l'interdiction est puni d'une amende.",
    categorie: "Sensibilisation",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 6,
    images: ["assets/produits/a10.jpg"],
    title: "Non aux ordures hors des bacs",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Oui. Il est interdit de jeter ou d'abandonner ses déchets dans la rue. De même, il est interdit de déposer ses déchets sans respecter les règles de collecte des déchets définies par la mairie (jour, horaires, tri). Dans les 2 cas, ne pas respecter l'interdiction est puni d'une amende.",
    categorie: "Sensibilisation",
    author: 'Carrefour',
    isPopular: true,
  ),
];
List<Actuality> demoActuality = [
  Actuality(
    id: 1,
    images: ["assets/produits/a3.png"],
    title: "Triez efficacement!",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Le tri sélectif des déchets à la maison n'appelle qu'à être optimisé. Dans le cas du verre, il est envisageable de réutiliser plusieurs fois les bouteilles avant de les recycler. Elles sont actuellement recyclées trop tôt, parfois même dès la première utilisation. Il faut aussi que ce tri soit mieux réalisé. Les Français mettent encore 40% de déchets qui pourraient être recyclés dans leurs bacs à ordures ménagères.",
    categorie: "Astuces",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 2,
    images: ["assets/produits/a4.jpg"],
    title: "Eviter le gaspillage",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Au cours du recyclage, les matières premières déjà utilisées sont traitées et réutilisées. D'un autre côté, ce qu’on appelle la revalorisation des objets permet de continuer à utiliser des déchets ou des articles usagés en les transformant et en les améliorant pour un nouvel usage.Voici quelques-unes de ces idées pour les vêtements, les bouteilles en plastique ou le gel de silice que l’on trouve notamment dans les sacs, les chaussures ou les vestes neufs. ",
    categorie: "Astuces",
    author: 'Sky News',
    isPopular: true,
  ),
  Actuality(
    id: 3,
    images: ["assets/produits/a5.jpg"],
    title: "Gagner plus de coins",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Le tri sélectif des déchets à la maison n'appelle qu'à être optimisé. Dans le cas du verre, il est envisageable de réutiliser plusieurs fois les bouteilles avant de les recycler. Elles sont actuellement recyclées trop tôt, parfois même dès la première utilisation. Il faut aussi que ce tri soit mieux réalisé. Les Français mettent encore 40% de déchets qui pourraient être recyclés dans leurs bacs à ordures ménagères.",
    categorie: "Astuces",
    author: 'Sky News',
    isPopular: true,
  ),
  Actuality(
    id: 4,
    images: ["assets/produits/a6.jpg"],
    title: "Soyons green!",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Le tri sélectif des déchets à la maison n'appelle qu'à être optimisé. Dans le cas du verre, il est envisageable de réutiliser plusieurs fois les bouteilles avant de les recycler. Elles sont actuellement recyclées trop tôt, parfois même dès la première utilisation. Il faut aussi que ce tri soit mieux réalisé. Les Français mettent encore 40% de déchets qui pourraient être recyclés dans leurs bacs à ordures ménagères.",
    categorie: "Astuces",
    author: 'Carrefour',
    isPopular: true,
  ),
  Actuality(
    id: 5,
    images: ["assets/produits/a9.jpg"],
    title: "Un monde Green!",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Le tri sélectif des déchets à la maison n'appelle qu'à être optimisé. Dans le cas du verre, il est envisageable de réutiliser plusieurs fois les bouteilles avant de les recycler. Elles sont actuellement recyclées trop tôt, parfois même dès la première utilisation. Il faut aussi que ce tri soit mieux réalisé. Les Français mettent encore 40% de déchets qui pourraient être recyclés dans leurs bacs à ordures ménagères.",
    categorie: "Astuces",
    author: 'Carrefour',
    isPopular: true,
  ),
];

final List<Actuality> autres = [
  Actuality(
    id: 1,
    images: ["assets/produits/a7.jpg"],
    title: "Voitures électriques",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Les émissions moyennes de CO2 (exprimées en norme NEDC corrélée) des voitures immatriculées en 2020 s’établissent à 96,8 g/km contre 111,5g/km en 2019. Cette baisse marquée s’explique principalement par l’augmentation de la part des voitures électriques et hybrides rechargeables dans les immatriculations neuves. Alors que cette part n’atteignait pas 3 % des ventes en 2019, elle s’établit à 11 % en 2020. Les mesures incitatives pour l’achat d’un véhicule à faibles émissions ainsi que la nouvelle réglementation européenne s’appliquant aux constructeurs automobiles ont favorisé cet essor.",
    categorie: "Autres",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 1,
    images: ["assets/produits/a8.jpg"],
    title: "Journée de la santé",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Partout dans le monde, certains groupes ont du mal à joindre les deux bouts avec un maigre revenu quotidien, ont de moins bonnes conditions de logement et un niveau d’instruction plus faible, ont moins de possibilités d’emploi, pâtissent d’une plus grande inégalité entre les sexes et ne bénéficient guère ou pas du tout d’environnements sûrs, d’une eau et d’un air propres, de la sécurité alimentaire et de services de santé. Il en résulte des souffrances inutiles, des maladies évitables et des décès prématurés. Nos sociétés et nos économies en souffrent aussi.",
    categorie: "Autres",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 2,
    images: ["assets/produits/a11.jpg"],
    title: "Savoir vivre",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Ce qu’on appelle « savoir-vivre » ou « politesse » se présente sous la forme d’un ensemble de règles proposant des modèles de conduite adaptés aux différentes situations sociales. Ce type de code existe dans toutes les cultures et son rôle y est fondamental. Prévoyant ce qu’il convient de faire en toutes circonstances, en ville comme au travail, il facilite en effet les rapports interpersonnels, prévient les hésitations, sauve de la gêne. Il permet ainsi à chacun de trouver sa place et de faire bonne figure devant les autres. Ne dit-on pas, d’ailleurs, que la politesse est « l’huile dans les rouages » des relations sociales ou d’une personne agréable à fréquenter qu’elle « a du savoir-vivre » ?",
    categorie: "Autres",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 3,
    images: ["assets/produits/a12.jpg"],
    title: "Un monde réinventé",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Ce qu’on appelle « savoir-vivre » ou « politesse » se présente sous la forme d’un ensemble de règles proposant des modèles de conduite adaptés aux différentes situations sociales. Ce type de code existe dans toutes les cultures et son rôle y est fondamental. Prévoyant ce qu’il convient de faire en toutes circonstances, en ville comme au travail, il facilite en effet les rapports interpersonnels, prévient les hésitations, sauve de la gêne. Il permet ainsi à chacun de trouver sa place et de faire bonne figure devant les autres. Ne dit-on pas, d’ailleurs, que la politesse est « l’huile dans les rouages » des relations sociales ou d’une personne agréable à fréquenter qu’elle « a du savoir-vivre » ?",
    categorie: "Autres",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
  Actuality(
    id: 1,
    images: ["assets/produits/a13.jpg"],
    title: "Soyons attentifs",
    date: DateFormat('2000-01-30 15:50'),
    content:
        "Partout dans le monde, certains groupes ont du mal à joindre les deux bouts avec un maigre revenu quotidien, ont de moins bonnes conditions de logement et un niveau d’instruction plus faible, ont moins de possibilités d’emploi, pâtissent d’une plus grande inégalité entre les sexes et ne bénéficient guère ou pas du tout d’environnements sûrs, d’une eau et d’un air propres, de la sécurité alimentaire et de services de santé. Il en résulte des souffrances inutiles, des maladies évitables et des décès prématurés. Nos sociétés et nos économies en souffrent aussi.",
    categorie: "Autres",
    author: 'Sky News',
    authorImg: 'assets/skyNews.png',
    isPopular: true,
  ),
];

const String description =
    "Ce ticket vous donne droit à un forfait d'appel téléphonique de xx jours avec xx garantie de XX temps...";
