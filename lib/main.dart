import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calory_tracker/providers/food_provider.dart';
import 'package:calory_tracker/pages/pages.dart';
import 'package:provider/provider.dart';

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
      home: FutureBuilder(
        future: _loadData(),
        builder: (context, AsyncSnapshot<bool?> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final result = snapshot.data ?? false;
          return result ? const CalculatorFoodPage() : const HelloPage();
        },
      ),
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

  Future<bool?> _loadData() async {
    await Future.delayed(const Duration(milliseconds: 1000),(){});
    return PreferenceUtils.getBool(UserConstants.saveData);
  }
}
