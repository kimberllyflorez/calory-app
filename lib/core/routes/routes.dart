import 'package:calory_tracker/calorie_calculator/ui/pages/calorie_recalcularion_page.dart';
import 'package:calory_tracker/home/ui/pages/home_page.dart';
import 'package:calory_tracker/information_user/ui/pages/activity_lavel_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/age_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/gender_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/goal_weight_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/height_page.dart';
import 'package:calory_tracker/information_user/ui/pages/percent_macronutrient_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/weight_pg.dart';
import 'package:calory_tracker/information_user/ui/pages/welcome_pg.dart';
import 'package:calory_tracker/login/ui/page/check_auth_pg.dart';
import 'package:calory_tracker/login/ui/page/login_page.dart';
import 'package:calory_tracker/login/ui/page/register_page.dart';

import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'helloPage': (_) => const WelcomPage(),
    'genderPage': (_) => const GenderPage(),
    'agePage': (_) => const AgePage(),
    'heightPage': (_) => const HeightPage(),
    'weightPage': (_) => const WeightPage(),
    'activityLabelPage': (_) => const ActivityLabelPage(),
    'nutrientGoal': (_) => const MacronutrientPercent(),
    'goalPage': (_) => const GoalPage(),
    'home': (_) => const HomePage(),
    'calorierecalculation': (_) => const CalorieRecalculationPage(),
    'login': (_) => const LoginScreen(),
    'register': (_) => const RegisterPage(),
    'cheackAuth': (_) => const CheckAuthPage(),
  };
}
