import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: 'Tshirt',
        price: 1000,
        description:
            'A style of fabric shirt named after the T shape of its body and sleeves. ',
        imagePath: 'assets/Tshirt.jpg'),

    //product 2
    Product(
        name: 'Watch',
        price: 2000,
        description:
            ' A small clock carried or worn by a person. It makes it easy to see the time. ',
        imagePath: 'assets/watch.jpg'),

    //product 3
    Product(
        name: 'Shoes',
        price: 3500,
        description:
            'Outer covering for the foot, usually of leather with a stiff or thick sole and heel.',
        imagePath: 'assets/shoes.jpg'),

    //product 4
    Product(
        name: 'Perfume',
        price: 1000,
        description:
            'give a pleasant and desirable scent to a person body, typically with the aim of increasing.',
        imagePath: 'assets/perfume.jpg'),
  ];

  //user cart

  List<Product> cart = [];

  //get product list

  List<Product> get shop => _shop;

  //get user cart
  List<Product> get Cart => cart;

  //add item to cart
  void addToCart(Product item) {
    cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeToCart(Product item) {
    cart.remove(item);
    notifyListeners();
  }
}
