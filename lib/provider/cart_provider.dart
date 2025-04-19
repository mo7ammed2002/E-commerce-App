// ignore_for_file: avoid_print

import 'package:e_commerce/model/product.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleCart(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
        print(element.quantity);
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  increaseQuantity(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decreaseQuantity(int index) {
    if (_cart[index].quantity < 2) {
      _cart.removeAt(index);
    } else {
      _cart[index].quantity--;
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (Product element in _cart) {
      totalPrice += element.price * element.quantity;
    }
    return totalPrice;
  }

  toRemove(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  orderProduct(){
    _cart = [];
  }
}
