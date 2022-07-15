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
    final width = MediaQuery
        .of(context)
        .size
        .width;

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
                  nutrientController: carbController,
                  onChanged: (value) => _onChanged(UserConstants.carbGoal, value),
                ),
                NutrientsGoal(
                  nameNutrint: '% Protein',
                  nutrientController: proteinController,
                  onChanged: (value) => _onChanged(UserConstants.proteinGoal, value),
                ),
                NutrientsGoal(
                  nameNutrint: '% fats  ',
                  nutrientController: fatController,
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
    final carbPercent = int.parse(carbController.text);
    final fatPercent = int.parse(fatController.text);
    final proteinPercent = int.parse(proteinController.text);

    final totalPercent =(carbPercent + fatPercent + proteinPercent);

    if (totalPercent != 100) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(child: Text("the total percent must be 100")),
      ));
      return;
    }
    PreferenceUtils.setBool(UserConstants.saveData, true);
    Navigator.pushNamed(context, 'calculatorFood');
  }

}

class NutrientsGoal extends StatelessWidget {

  final String nameNutrint;
  final Function(String)? onChanged;
  final TextEditingController? nutrientController;

  const NutrientsGoal({
    Key? key,

    required this.nameNutrint,
    this.onChanged,
    this.nutrientController
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
            controller: nutrientController,
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
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: onChanged,
          ),
        ),
        Text(nameNutrint),
      ],
    );
  }
}
