import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> products = [];
  
  addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }
  
}