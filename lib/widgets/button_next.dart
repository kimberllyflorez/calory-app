import 'package:calory_tracker/repository/food_provider.dart';
import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String? nextPage;
  final String? textButton;

  const ButtonNext({
    Key? key,
    required this.nextPage,
    this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, nextPage ?? 'firstPage');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.green,
        ),
        width: 80,
        height: 50,
        child: Center(
          child: Text(textButton ?? 'Next'),
        ),
      ),
    );
  }
}
