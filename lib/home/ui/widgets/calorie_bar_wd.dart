import 'package:calory_tracker/home/ui/widgets/percent_indicator_wd.dart';
import 'package:flutter/material.dart';
class CalorieBar extends StatelessWidget {
  const CalorieBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4ECDC4),
            Color(0xFF556270),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: const PercentIndicatorWd(),
    );
  }
}