import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/controllers/calorie_controller.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MacronutrientPercent extends StatefulWidget {
  const MacronutrientPercent({Key? key}) : super(key: key);

  @override
  State<MacronutrientPercent> createState() => _MacronutrientPercentState();
}

class _MacronutrientPercentState extends State<MacronutrientPercent> {
  late final TextEditingController carbController;
  late final TextEditingController proteinController;
  late final TextEditingController fatController;

  @override
  void initState() {
    carbController = TextEditingController(text: '0');
    proteinController = TextEditingController(text: '0');
    fatController = TextEditingController(text: '0');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('what are your nutrient goals?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Column(
              children: [
                NutrientsGoal(
                  nameNutrient: '% carbs ',
                  nutrientController: carbController,
                  onChanged: (value) => _onChanged(UserConstants.carbPercent, value),
                ),
                NutrientsGoal(
                  nameNutrient: '% Protein',
                  nutrientController: proteinController,
                  onChanged: (value) => _onChanged(UserConstants.proteinPercent, value),
                ),
                NutrientsGoal(
                  nameNutrient: '% fats     ',
                  nutrientController: fatController,
                  onChanged: (value) => _onChanged(UserConstants.fatPercent, value),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onChanged(String key, String value) async {
    await PreferenceUtils.setString(key, value);
  }

  _onTap() async {
    final carbPercent = int.parse(carbController.text);
    final fatPercent = int.parse(fatController.text);
    final proteinPercent = int.parse(proteinController.text);
    final totalPercent = (carbPercent + fatPercent + proteinPercent);
    if (totalPercent != 100) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("the total percent must be 100"),
      ));
      return;
    }
    await PreferenceUtils.setBool(UserConstants.saveData, true);
    await _calcCalories();

    Navigator.pushNamed(context, 'calculatorFood');
  }

  Future<void> _calcCalories() async {
    final String prefAge = await PreferenceUtils.getString(UserConstants.age);
    final bool? gender = await PreferenceUtils.getBool(UserConstants.genderData);
    final String prefHeight = await PreferenceUtils.getString(UserConstants.height);
    final double weight = await PreferenceUtils.getDouble(UserConstants.weight);
    final int goalWeight = await PreferenceUtils.getInt(UserConstants.gainWeight);
    final int activityNet = await PreferenceUtils.getInt(UserConstants.levelActivity);

    var age = int.parse(prefAge);
    var height = double.parse(prefHeight);
    double activityLevel = UserConstants.activityLevels[activityNet] ?? 0.0;
    int goal = UserConstants.goalWeights[goalWeight] ?? 0;

    final calorieController = CalorieController(
      weight: weight,
      isWomen: gender ?? false,
      height: height,
      age: age,
      net: activityLevel,
      goal: goal,
    );

    final calories = calorieController.calcCalorie();
    PreferenceUtils.setDouble(UserConstants.userCalories, calories);
  }
}

class NutrientsGoal extends StatelessWidget {
  final String nameNutrient;
  final Function(String)? onChanged;
  final TextEditingController? nutrientController;

  const NutrientsGoal(
      {Key? key, required this.nameNutrient, this.onChanged, this.nutrientController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: TextFormField(
            textAlign: TextAlign.center,
            autofocus: false,
            controller: nutrientController,
            style: const TextStyle(
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 60,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: onChanged,
          ),
        ),
        Text(nameNutrient),
      ],
    );
  }
}
