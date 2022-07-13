import 'dart:async';

import 'package:calory_tracker/helpers/debounce.dart';
import 'package:calory_tracker/model/model_search.dart';
import 'package:calory_tracker/repository/food_repository.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  final repository = FoodRepository();
  final debounce = Debouncer(duration: const Duration(milliseconds: 500));
  SearchFoodModel? searchFood;
  bool isLoading = false;

  _fetchFood(String query) async {
    _setLoading();
    searchFood = await repository.getFoodSearch(query);
    isLoading = false;
    notifyListeners();
  }

  _cleanList(){
    searchFood = null;
    notifyListeners();
  }

  _setLoading(){
    isLoading = true;
    notifyListeners();
  }

  fetchFoodByQuery(String query) {
    debounce.value = '';
    debounce.onValue = (value) async {
      if (query.isNotEmpty) {
        _fetchFood(value);
      }
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debounce.value = query;
    });
    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
