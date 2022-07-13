import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NutrientGoal extends StatefulWidget {
  const NutrientGoal({Key? key}) : super(key: key);

  @override
  State<NutrientGoal> createState() => _NutrientGoalState();
}

class _NutrientGoalState extends State<NutrientGoal> {
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
                  nameNutrint: '% carbs',
                  initialValue: '0',
                  onChanged: (value) => _onChanged(UserConstants.carbGoal, value),
                ),
                NutrientsGoal(
                  nameNutrint: '% Protein',
                  initialValue: '0',
                  onChanged: (value) => _onChanged(UserConstants.proteinGoal, value),
                ),
                NutrientsGoal(
                  nameNutrint: '% fats',
                  initialValue: '0',
                  onChanged: (value) => _onChanged(UserConstants.fatGoal, value),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onChanged(String key, String value) {
    PreferenceUtils.setString(key, value);
  }

  _onTap() {
    PreferenceUtils.setBool(UserConstants.saveData, true);
    Navigator.pushNamed(context, 'calculatorFood');
  }
}

class NutrientsGoal extends StatelessWidget {
  final String initialValue;
  final String nameNutrint;
  final Function(String)? onChanged;

  const NutrientsGoal({
    Key? key,
    required this.initialValue,
    required this.nameNutrint,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: TextFormField(
            textAlign: TextAlign.center,
            autofocus: false,
            initialValue: initialValue,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
              fontSize: 60,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: onChanged,
          ),
        ),
        Text(nameNutrint),
      ],
    );
  }
}
