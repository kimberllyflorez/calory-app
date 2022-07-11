import 'package:provider/provider.dart';

import 'package:calory_tracker/pages/pages.dart';
import 'package:flutter/material.dart';

import 'repository/food_provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'helloPage',
      routes: {
        'helloPage': (_) => const HelloPage(),
        'genderPage': (_) => const GenderPage(),
        'agePage': (_) => const AgePage(),
        'heightPage': (_) => const HeightPage(),
        'weightPage': (_) => const weightPage(),
        'activityLabelPage': (_) => const ActivityLabelPage(),
        'nutrientGoal': (_) => const NutrientGoal(),
        'goalPage': (_) => const GoalPage(),
        'calculatorFood': (_) => const CalculatorFoodPage(),
        'searchFood': (_) => const SearchFood(),
      },
    );
  }
}
