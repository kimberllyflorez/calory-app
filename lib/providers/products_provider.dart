import 'package:calory_tracker/helpers/number_helper.dart';
import 'package:calory_tracker/model/model_macros.dart';
import 'package:calory_tracker/model/model_product.dart';
import 'package:calory_tracker/repository/auth_repository.dart';
import 'package:calory_tracker/repository/meals_repository.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final AuthRepository? authRepository;
  late final MealsRepository _mealsRepository;

  List<Product> breakfastProduct = [];
  List<Product> lunchProduct = [];
  List<Product> dinnerProduct = [];
  List<Product> snackProduct = [];

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

  Future<void> removeProduct(Product product, int index) async {
    final productId = product.id ?? '';
    if (index == 0) {
      breakfastProduct.remove(product);
      _deleteProductFromMeals('breakfast', productId);
    }
    if (index == 1) {
      lunchProduct.remove(product);
      await _deleteProductFromMeals('lunch', productId);
    }
    if (index == 2) {
      dinnerProduct.remove(product);
      await _deleteProductFromMeals('dinner', productId);
    }
    if (index == 3) {
      snackProduct.remove(product);
      await _deleteProductFromMeals('snack', productId);
    }
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
    return macro.toPrecision(2);
  }

  double _calcFatGrams(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.fat ?? 0.0;
    }
    return macro.toPrecision(2);
  }

  double _calcCarbGrams(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.carbohydrates ?? 0.0;
    }
    return macro.toPrecision(2);
  }

  double _totalCaloriesPerList(List<Product> products) {
    double macro = 0.0;
    for (var product in products) {
      macro += product.nutriments?.energyKcal ?? 0.0;
    }
    return macro.toPrecision(2);
  }

  void _calcTotalCalories() {
    final breakfastMacro = _getMacrosPerList(breakfastProduct);
    final lunchMacro = _getMacrosPerList(lunchProduct);
    final dinnerMacro = _getMacrosPerList(dinnerProduct);
    final snackMacro = _getMacrosPerList(snackProduct);
    final totalProtein = breakfastMacro.proteinGrams +
        lunchMacro.proteinGrams +
        dinnerMacro.proteinGrams +
        snackMacro.proteinGrams;
    final totalCarbs = breakfastMacro.carbohydrateGrams +
        lunchMacro.carbohydrateGrams +
        dinnerMacro.carbohydrateGrams +
        snackMacro.carbohydrateGrams;
    final totalFats =
        breakfastMacro.fatGrams + lunchMacro.fatGrams + dinnerMacro.fatGrams + snackMacro.fatGrams;
    final totalCal = breakfastMacro.totalCalories +
        lunchMacro.totalCalories +
        dinnerMacro.totalCalories +
        snackMacro.totalCalories;
    totalSelectProtein = totalProtein.toPrecision(2);
    totalSelectCarbs = totalCarbs.toPrecision(2);
    totalSelectFats = totalFats.toPrecision(2);
    totalSelectedCalories = totalCal.toPrecision(2);
  }

  Future<void> loadProductsFromDB() async {
    breakfastProduct = await _getProductByMeal('breakfast');
    lunchProduct = await _getProductByMeal('lunch');
    dinnerProduct = await _getProductByMeal('dinner');
    lunchProduct = await _getProductByMeal('snack');

    _calcTotalCalories();
    notifyListeners();
  }

  Future<List<Product>> _getProductByMeal(String mealName) async {
    final userId = await authRepository?.getUserId() ?? '';
    return await _mealsRepository.getMealsData(userId, mealName);
  }

  Future<bool> _deleteProductFromMeals(String mealName, String productId) async {
    final userId = await authRepository?.getUserId() ?? '';
    return await _mealsRepository.deleteProductFromMeals(userId, mealName, productId);
  }
}
