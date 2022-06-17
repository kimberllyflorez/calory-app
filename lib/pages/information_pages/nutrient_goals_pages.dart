import 'package:calory_tracker/Widgets/Button_Next.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NutrientGoal extends StatelessWidget {
  const NutrientGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('what are your nutrient goals?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child:Column (
               children: [
                 NutrientsGoal(nameNutrint: '% carbs', initialValue: '40'),
                 NutrientsGoal(nameNutrint: '% Protein', initialValue: '30'),
                 NutrientsGoal(nameNutrint: '% fats', initialValue: '30'),


               ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'calculatorFood')
      ,
    );
  }
}

class NutrientsGoal extends StatelessWidget {
  final String initialValue;
  final String nameNutrint;

  const NutrientsGoal({
    Key? key,
    required this.initialValue,
    required this.nameNutrint,
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
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
              //style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300),,
              decoration: InputDecoration(
                border: InputBorder.none,
                //hoverColor: Colors.green,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
              ]
          ),
        ),
        Text(nameNutrint)
      ],
    );
  }
}
