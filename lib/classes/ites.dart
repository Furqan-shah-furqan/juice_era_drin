import 'package:get/get.dart';

class Items {
  final String name;
  final String description;
  double price;
  final String image;
  final String rating;
  RxBool isFavorite;
  

  Items({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Items && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

// ✅ Define a global list of items
List<Items> itemsList = [
  Items(
      name: 'OJ Pear Juice',
      description: 'Freshly Picked pears pure Juice',
      image: 'assets/images/new1.png',
      price: 20.0, // Remove quotes
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'OJ Orange Juice',
      description: 'Freshly Squeezed Orange Juice',
      image: 'assets/images/new2.png',
      price: 25.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: "Apple It's Juice",
      description: 'Freshly Picked Apples pure Juice',
      image: 'assets/images/new3.png',
      price: 30.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: "Orange It's Juice",
      description: 'Freshly Squeezed Orange Juice',
      image: 'assets/images/new4.png',
      price: 20.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Fruitea Blueberry Burst',
      description: 'Sparkling Blueberry Tea',
      image: 'assets/images/new5.png',
      price: 45.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Fruitea',
      description: 'Sparkling Pineapple Punch',
      image: 'assets/images/new6.png',
      price: 40.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Primo Caramel',
      description: 'Caramel Coffee Flavour',
      image: 'assets/images/new7.png',
      price: 35.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Primo Creamy',
      description: 'Creamy Coffee Flavour',
      image: 'assets/images/new8.png',
      price: 35.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Naturalist Pomegranate',
      description: 'Pomegranate Juice',
      image: 'assets/images/new9.png',
      price: 55.0,
      rating: '4.5',
      isFavorite: false),
  Items(
      name: 'Naturalist Strawberry',
      description: 'Strawberry Milk Shake',
      image: 'assets/images/new10.png',
      price: 55.0,
      rating: '4.5',
      isFavorite: false),
];
