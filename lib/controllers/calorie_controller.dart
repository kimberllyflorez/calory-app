import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/model/model_user_info.dart';
import 'package:calory_tracker/providers/user_preferences_helper.dart';

class CalorieController {
  static const double defaultMultiplierWomen = 655;
  static const double defaultMultiplierMen = 65.4;
  static const double multiplierWeightWomen = 9.4;
  static const double multiplierWeightMen = 13.75;
  static const double multiplierHeightMen = 5.0;
  static const double multiplierHeightWomen = 1.8;
  static const double multiplierAgeMen = 6.75;
  static const double multiplierAgeWomen = 4.6;

  ///Constructor variables
  late double weight;
  late bool isWomen;
  late double height;
  late int age;
  late double net;
  late int goal;

  ///Constructor
  CalorieController();

  Future<void> setAndCalcCaloriesData() async {
    final helper = UserPreferencesHelper();
    final UserInfoModel userModel = await helper.getUserInfoModel();
    double netValue = UserConstants.activityLevels[userModel.activityLevel] ?? 0.0;
    weight = userModel.weight;
    isWomen = userModel.gender;
    height = userModel.height;
    age = userModel.age;
    net = netValue;
    goal = userModel.goalWeight;
    final calories = calcCalorie();
    await helper.setUserCalories(calories);
  }

  ///CalcCalories by gender
  double calcCalorie() {
    double gebValue = 0.0;
    if (isWomen) {
      gebValue = calcGeb(
          defaultMultiplierWomen, multiplierWeightWomen, multiplierHeightWomen, multiplierAgeWomen);
    } else {
      gebValue =
          calcGeb(defaultMultiplierMen, multiplierWeightMen, multiplierHeightMen, multiplierAgeMen);
    }
    final double etaValue = etaEquation(gebValue);
    final double getValue = getEquation(etaValue);
    final double adjustCalories = adjustCalorieEquation(getValue, goal);
    final double calorieFats = fatCalorieEquation(adjustCalories);
    final double calorieProtein = proteinCalorieEquation(weight);
    final double caloriesCarbs = carbsCalorieEquation(calorieFats, calorieProtein, adjustCalories);
    return adjustCalories;
  }

  ///Default calorie calculation equation
  double calcGeb(double defaultMult, double weightMul, double heightMul, double ageMult) {
    return (defaultMult) + (weightMul * weight) + (heightMul * height) - (ageMult * age);
  }

  ///thermal energy of the food
  double etaEquation(double geb) {
    return geb * 1.1;
  }

  /// total energy expenditure
  double getEquation(double eta) {
    return eta * net;
  }

  ///caloricAdjustment
  double adjustCalorieEquation(double get, int adjustValue) {
    if (adjustValue != 0) {
      final adjustCalories = (get * adjustValue) / 100;
      return get + adjustCalories;
    }
    return get;
  }

  /// ecuation calulate to grams od fat - datun 30%
  double fatCalorieEquation(double adjustCalories) {
    final fatCalories = ((adjustCalories * 30) / 100);
    final calcGramsFat = fatCalories * 9;
    return calcGramsFat;
  }

  ///ecuation calulate to grams od protein - mult 2
  double proteinCalorieEquation(double weight) {
    final proteinCalories = (weight * 2);
    final proteinGrams = proteinCalories * 4;
    return proteinGrams;
  }

  /// ecuation calulate to grams od carbs
  double carbsCalorieEquation(double adjustCalories, double gramsCarbs, double gramsProtein) {
    final carbsCalories = adjustCalories - (gramsCarbs + gramsProtein);
    return carbsCalories;
  }

  double calcGrams(int factor, double calories) {
    return calories / factor;
  }
}
