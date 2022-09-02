import 'package:calory_tracker/model/model_macros.dart';
import 'package:calory_tracker/model/model_product.dart';
import 'package:calory_tracker/repository/auth_repository.dart';
import 'package:calory_tracker/repository/meals_repository.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final AuthRepository? authRepository;
  late final MealsRepository _mealsRepository;

  final List<Product> breakfastProduct = [];
  final List<Product> lunchProduct = [];
  final List<Product> dinnerProduct = [];
  final List<Product> snackProduct = [];

  double totalSelectedCalories = 0.0;
  double totalSelectProtein = 0.0;
  double totalSelectCarbs = 0.0;
  double totalSelectFats = 0.0;

  bool isSelectProduct = false;

  ProductsProvider({
    this.authRepository,
  }) {
    _mealsRepository = MealsRepository();
  }

  Future<void> addProduct(Product product, int index) async {
    if (index == 0) {
      breakfastProduct.add(product);
      await _saveDataToDB(product, 'breakfast');
    }
    if (index == 1) {
      lunchProduct.add(product);
      await _saveDataToDB(product, 'lunch');
    }

    if (index == 2) {
      dinnerProduct.add(product);
      await _saveDataToDB(product, 'dinner');
    }
    if (index == 3) {
      snackProduct.add(product);
      await _saveDataToDB(product, 'snack');
    }
    _calcTotalCalories();
    notifyListeners();
  }

  Future<void> _saveDataToDB(Product product, String mealName) async {
    final userId = await authRepository?.getUserId() ?? '';
    _mealsRepository.saveMealsData(userId, product, mealName);
  }

  void removeProduct(Product product, int index) {
    if (index == 0) breakfastProduct.remove(product);
    if (index == 1) lunchProduct.remove(product);
    if (index == 2) dinnerProduct.remove(product);
    if (index == 3) snackProduct.remove(product);
    _calcTotalCalories();
    notifyListeners();
  }

  List<Product> getListFoods(int index) {
    if (index == 0) return breakfastProduct;
    if (index == 1) return lunchProduct;
    if (index == 2) return dinnerProduct;
    return snackProduct;
  }

  ModelMacros macroForFood(int index) {
    if (index == 0) return _getMacrosPerList(breakfastProduct);
    if (index == 1) return _getMacrosPerList(lunchProduct);
    if (index == 2) return _getMacrosPerList(dinnerProduct);
    return _getMacrosPerList(snackProduct);
  }

  ModelMacros _getMacrosPerList(List<Product> products) {
    return ModelMacros(
      proteinGrams: _calcProteinGrams(products),
      fatGrams: _calcFatGrams(products),
      carbohydrateGrams: _calcCarbGrams(products),
      totalCalories: _totalCaloriesPerList(products),
    );
  }

  double _calcProteinGrams(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.proteins ?? 0.0;
    }
    return macro;
  }

  double _calcFatGrams(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.fat ?? 0.0;
    }
    return macro;
  }

  double _calcCarbGrams(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.carbohydrates ?? 0.0;
    }
    return macro;
  }

  double _totalCaloriesPerList(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.energyKcalServing ?? 0.0;
    }
    return macro;
  }

  void _calcTotalCalories() {
    final breakfastMacro = _getMacrosPerList(breakfastProduct);
    final lunchMacro = _getMacrosPerList(lunchProduct);
    final dinnerMacro = _getMacrosPerList(dinnerProduct);
    final snackMacro = _getMacrosPerList(snackProduct);
    totalSelectProtein = breakfastMacro.proteinGrams +
        lunchMacro.proteinGrams +
        dinnerMacro.proteinGrams +
        snackMacro.proteinGrams;
    totalSelectCarbs = breakfastMacro.carbohydrateGrams +
        lunchMacro.carbohydrateGrams +
        dinnerMacro.carbohydrateGrams +
        snackMacro.carbohydrateGrams;
    totalSelectFats =
        breakfastMacro.fatGrams + lunchMacro.fatGrams + dinnerMacro.fatGrams + snackMacro.fatGrams;
    totalSelectedCalories = breakfastMacro.totalCalories +
        lunchMacro.totalCalories +
        dinnerMacro.totalCalories +
        snackMacro.totalCalories;
  }
}
