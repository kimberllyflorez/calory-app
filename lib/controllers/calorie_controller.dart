class CalorieController {
  static const double defaultMultiplierWomen = 66.4;
  static const double defaultMultiplierMen = 655;
  static const double multiplierWeightWomen = 9.4;
  static const double multiplierWeightMen = 13.75;
  static const double multiplierHeightMen = 5.0;
  static const double multiplierHeightWomen = 1.8;
  static const double multiplierAgeMen = 6.75;
  static const double multiplierAgeWomen = 4.6;

  ///Constructor variables
  final double weight;
  final bool isWomen;
  final double height;
  final int age;
  final double net;

  final int goal;

  ///Constructor
  CalorieController({
    required this.weight,
    required this.isWomen,
    required this.height,
    required this.age,
    required this.net,
    required this.goal,
  });

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
    return adjustCalories;
  }

  ///Default calorie calculation equation
  double calcGeb(double defaultMult, double weightMul, double heightMul, double ageMult) {
    return defaultMult + (weightMul * weight) + (heightMul * height) - (ageMult * age);
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
      return (get * adjustValue) / 100;
    }
    return get;
  }

  double fatCalorieEquation(double adjustCalories, int fatPercent) {
    final fatCalories = (adjustCalories * fatPercent) / 100;
    return calcGrams(9, fatCalories);
  }

  double proteinCalorieEquation(double adjustCalories, int proteinPercent) {
    final proteinCalories = (adjustCalories * proteinPercent) / 100;
    return calcGrams(4, proteinCalories);
  }

  double carbsCalorieEquation(double adjustCalories, int carbsPercent) {
    final carbsCalories = (adjustCalories * carbsPercent) / 100;
    return calcGrams(4, carbsCalories);
  }

  double calcGrams(int factor, double calories) {
    return calories / factor;
  }
}
