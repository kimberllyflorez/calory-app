import 'package:calory_tracker/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(

      ),
      initialRoute: 'helloPage',
      routes: {
        'helloPage': (_)=> HelloPage(),
        'genderPage': (_)=>GenderPage(),
        'agePage': (_)=> AgePage(),
        'heightPage': (_)=> HeightPage(),
        'weightPage': (_)=> weightPage(),
        'activityLabelPage': (_)=> ActivityLabelPage(),
        'nutrientgoal': (_)=> NutrientGoal(),
        'goalPage': (_)=> GoalPage(),
        'calculatorFood':(_)=> CalculatorFoodPage()
      },
    );
  }
}
