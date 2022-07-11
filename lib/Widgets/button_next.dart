import 'package:calory_tracker/repository/food_provider.dart';
import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String? nextPage;
  final String? textButton;

  const ButtonNext({Key? key, required this.nextPage, this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () async {
          final food  = FoodProvider();
          final data = await food.getJsonData('ice cream');
          Navigator.pushNamed(context, nextPage ?? 'firstPage');
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.green),
          width: 80,
          height: 50,
          child: Center(child: Text(textButton ?? 'Next')),
        ));
  }
}
