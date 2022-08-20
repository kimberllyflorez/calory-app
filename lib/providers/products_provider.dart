import 'package:calory_tracker/model/model_product.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Product> breakfastProduct = [];
  final List<Product> lunchProduct = [];
  final List<Product> dinnerProduct = [];
  final List<Product> snackProduct = [];

  bool isSelectProduct = false;

  addProduct(Product product, int index) {
    if (index == 0) breakfastProduct.add(product);
    if (index == 1) lunchProduct.add(product);
    if (index == 2) dinnerProduct.add(product);
    if (index == 3) snackProduct.add(product);
    notifyListeners();
  }

  removeProduct(Product product, int index) {
    if (index == 0) breakfastProduct.remove(product);
    if (index == 1) lunchProduct.remove(product);
    if (index == 2) dinnerProduct.remove(product);
    if (index == 3) snackProduct.remove(product);
    notifyListeners();
  }

  getListFoods(int index) {
    if (index == 0) return breakfastProduct;
    if (index == 1) return lunchProduct;
    if (index == 2) return dinnerProduct;
    return snackProduct;
  }
}
