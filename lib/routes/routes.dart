import 'package:calory_tracker/pages/pages.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'helloPage': (_) => const HelloPage(),
    'genderPage': (_) => const GenderPage(),
    'agePage': (_) => const AgePage(),
    'heightPage': (_) => const HeightPage(),
    'weightPage': (_) => const weightPage(),
    'activityLabelPage': (_) => const ActivityLabelPage(),
    'nutrientGoal': (_) => const MacronutrientPercent(),
    'goalPage': (_) => const GoalPage(),
    'calculatorFood': (_) => const CalculatorFoodPage(),
    'editProfil': (_) => const UserPreferencePage(),
  };
}
