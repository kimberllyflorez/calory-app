import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String? nextPage;
  final String? textButton;

  const ButtonNext({Key? key, required this.nextPage,  this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, nextPage ?? 'firstPage'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green
          ) ,
          width: 80,
          height: 50,
          child: Center(child: Text(textButton ?? 'Next')),
        )


    );

  }
}
