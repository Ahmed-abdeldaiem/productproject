import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String title, imageurl, description;
  double price;
  bool isFav;

  Product(this.title, this.price, this.imageurl, this.description,
      {this.isFav = false});
}

class Products with ChangeNotifier {
  final List<Product> _favoriteproduct = [];
  /*late var len = myproduct.length;
  int listlenth(len) {
    return len;
  }
*/
//getter
  List<Product> get getProducts => [..._myproduct];

  List<Product> get getFav => [..._favoriteproduct];

  void addFavProduct(String title) {
    _favoriteproduct
        .add(_myproduct.firstWhere((element) => element.title == title));
    notifyListeners();
  }

  void removeFavProduct(String title) {
    _favoriteproduct.removeWhere((element) => element.title == title);
    notifyListeners();
  }

  final List<Product> _myproduct = [
    Product(
        'Summer Shirt',
        150,
        'https://pipiluxury.com/wp-content/uploads/2020/02/2020-Summer-Shirt-Mens-Ethnic-Short-Sleeve-Casual-Printing-Hawaiian-Shirt-Blouse-Shirtcamisa-masculina.jpg',
        'Summer Shirt'),
    Product(
        'cotton shirt',
        100,
        'https://www.jimthompson.com/pub/media/catalog/product/cache/e593c63d1e6eacc388928878fedae72e/j/t/jt_aw21_rtwpack_mens03092.jpg',
        'cotton shirt'),
    Product(
        'adidas shirt',
        250,
        'https://ae01.alicdn.com/kf/HTB1XBYPPXXXXXbGXXXXq6xXFXXXC/D2M.jpg',
        'adidas shirt'),
    Product(
        'sweatshirt',
        200,
        'https://i.sportisimo.com/products/images/1152/1152481/450x450/champion-hooded-full-zip-sweatshirt_0.jpg',
        'sweatshirt')
  ];
}
