import 'dart:developer';

import 'package:calory_tracker/model/model_product.dart';
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
          productList.add(Product.fromFirebaseMap(value));
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
}


