import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String title;
  double price;

  Cart(this.title, this.price);
}

class Carts with ChangeNotifier {
  List<Cart> get getCarts => [..._mycart];

  void addcart(String title, double price) {
    _mycart.add(Cart(title, price));
    notifyListeners();
  }

  void removecart(String title) {
    _mycart.removeWhere((element) => element.title == title);
    notifyListeners();
  }

  final List<Cart> _mycart = [];
}
