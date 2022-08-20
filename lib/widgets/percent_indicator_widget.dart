import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WidgetCustomeAppBar extends StatelessWidget {
  const WidgetCustomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PercentIndicatorCircles(),
        FutureBuilder(
          future: PreferenceUtils.getDouble(UserConstants.userCalories),
          builder: (context, snapshot) {
            final calories = snapshot.data.toString() ;
            return Text(calories);
          },
          
        )
      ],
    );
  }
}

class PercentIndicatorCircles extends StatelessWidget {
  const PercentIndicatorCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: 0.30,
          center: const Text("carbs%"),
          progressColor: Colors.red,
        ),
        const SizedBox(width: 20),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: 0.50,
          center: const Text("fat%"),
          progressColor: Colors.orange,
        ),
        const SizedBox(width: 20),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: 0.80,
          center: const Text("protein%"),
          progressColor: Colors.yellow,
        ),
      ],
    );
  }
}
