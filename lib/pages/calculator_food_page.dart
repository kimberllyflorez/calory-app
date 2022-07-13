import 'dart:ui';
import 'package:calory_tracker/Widgets/expandable_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorFoodPage extends StatelessWidget {
  const CalculatorFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              // height: height * 0.5,
            ),
            Container(
              child: _foodHistory(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 600,
              child: Expandablewidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _foodHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.arrow_back_outlined),
        Text('aqui va el dia'),
        Icon(Icons.arrow_forward_outlined),
      ],
    );
  }
}
