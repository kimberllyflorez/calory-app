import 'dart:developer';

import 'package:calory_tracker/products/model/model_product.dart';
import 'package:firebase_database/firebase_database.dart';

class MealsRepository {
  Future<bool> saveMealsData(String userId, Product product, String mealName) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("$userId/meals/$mealName/");
      await ref.push().update(product.toMap());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Product>> getMealsData(String userId, String mealName) async {
    final List<Product> productList = [];
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('$userId/meals/$mealName/').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          productList.add(Product.fromFirebaseMap(value, key));
        });
      } else {
        print('No data available.');
      }
      return productList;
    } catch (e) {
      log(e.toString());
      return productList;
    }
  }

  Future<bool> deleteProductFromMeals(String userId, String mealName, String productId) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      await ref.child('$userId/meals/$mealName/$productId').remove();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
