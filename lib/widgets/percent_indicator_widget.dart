import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/providers/products_provider.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class WidgetCustomerAppBar extends StatelessWidget {
  const WidgetCustomerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectCalories = context.watch<ProductsProvider>().totalSelectedCalories;

    return FutureBuilder(
      future: PreferenceUtils.getDouble(UserConstants.userCalories),
      builder: (context, AsyncSnapshot<double?> snapshot) {
        int goalCalories = 0;
        double caloriesPercentage = 0.0;
        if (snapshot.connectionState == ConnectionState.done) {
          goalCalories = snapshot.data?.toInt() ?? 0;
          caloriesPercentage = (selectCalories * 100) / goalCalories;
        }
        return Column(
          children: [
            CaloricGoal(
              selectCalories: selectCalories,
              goalCalories: goalCalories,
            ),
            LinearPercentCalorie(
              percent: caloriesPercentage,
            ),
            const PercentIndicatorCircles(),
          ],
        );
      },
    );
  }
}

class CaloricGoal extends StatelessWidget {
  final int goalCalories;
  final double selectCalories;

  const CaloricGoal({
    Key? key,
    required this.goalCalories,
    required this.selectCalories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$selectCalories Kcal'),
            _GoalCalories(calories: goalCalories),
          ],
        ));
  }
}

class _GoalCalories extends StatelessWidget {
  final int calories;

  const _GoalCalories({
    Key? key,
    required this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text('You goal:', style: textStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              calories.toString(),
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            const Text(' Kcal')
          ],
        ),
      ],
    );
  }
}

class PercentIndicatorCircles extends StatelessWidget {
  const PercentIndicatorCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final proteins = context.watch<ProductsProvider>().totalSelectProtein;
    final carbs = context.watch<ProductsProvider>().totalSelectCarbs;
    final fats = context.watch<ProductsProvider>().totalSelectFats;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: proteins / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("$proteins gr"),
              const Text("Proteins"),
            ],
          ),
          progressColor: Colors.red,
        ),
        const SizedBox(width: 20),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: carbs / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("$carbs gr"),
              const Text("Carbs"),
            ],
          ),
          progressColor: Colors.orange,
        ),
        const SizedBox(width: 20),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 4.0,
          percent: fats / 100,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("$fats gr"),
              const Text("Fats"),
            ],
          ),
          progressColor: Colors.yellow,
        ),
      ],
    );
  }
}

class LinearPercentCalorie extends StatelessWidget {
  final double percent;

  const LinearPercentCalorie({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double graphicValue = percent / 100;
    if (graphicValue < 0.0) {
      graphicValue = 0.0;
    } else if (graphicValue > 1.0) {
      graphicValue = 1.0;
    }
    final int percentValue = percent.toInt();
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
      child: LinearPercentIndicator(
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2000,
        percent: graphicValue,
        center: Text(
          "$percentValue  %",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        //linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: AppTheme.secundary,
      ),
    );
  }
}
