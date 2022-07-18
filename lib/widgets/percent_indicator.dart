import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(15.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 4.0,
            percent: 0.30,
            center:  Text("carbs%"),
            progressColor: Colors.red,
          ),
           SizedBox(width: 20),
           CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 4.0,
            percent: 0.50,
            center:  Text("fat%"),
            progressColor: Colors.orange,
          ),
          SizedBox(width: 20),
          CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 4.0,
            percent: 0.80,
            center:  Text("protein%"),
            progressColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

