import 'package:calory_tracker/calorie_calculator/ui/calorie_recalcularion_page.dart';
import 'package:calory_tracker/home/ui/pages/home_page.dart';
import 'package:calory_tracker/information_user/pages/activity_lavel_page.dart';
import 'package:calory_tracker/information_user/pages/age_page.dart';
import 'package:calory_tracker/information_user/pages/gender_page.dart';
import 'package:calory_tracker/information_user/pages/goal_weight_page.dart';
import 'package:calory_tracker/information_user/pages/height_page.dart';
import 'package:calory_tracker/information_user/pages/percent_macronutrient_pages.dart';
import 'package:calory_tracker/information_user/pages/weight_page.dart';
import 'package:calory_tracker/information_user/pages/welcome_introduction_page.dart';
import 'package:calory_tracker/login/pages/check_auth_page.dart';
import 'package:calory_tracker/login/pages/login_page.dart';
import 'package:calory_tracker/login/pages/register_page.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'helloPage': (_) => const WelcomPage(),
    'genderPage': (_) => const GenderPage(),
    'agePage': (_) => const AgePage(),
    'heightPage': (_) => const HeightPage(),
    'weightPage': (_) => const weightPage(),
    'activityLabelPage': (_) => const ActivityLabelPage(),
    'nutrientGoal': (_) => const MacronutrientPercent(),
    'goalPage': (_) => const GoalPage(),
    'calculatorFood': (_) => const HomePage(),
    'calorierecalculation': (_) => const CalorieRecalculationPage(),
    'login': (_) => const LoginScreen(),
    'register': (_) => const RegisterPage(),
    'cheackAuth': (_) => const CheckAuthPage(),
  };
}
