import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/providers/theme_modo_provider.dart';
import 'package:calory_tracker/routes/routes.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:calory_tracker/providers/food_provider.dart';
import 'package:calory_tracker/pages/pages.dart';
import 'package:provider/provider.dart';
import 'providers/products_provider.dart';

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
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeSelectProvider()),
      ],
      child: const CaloryApp(),
    );
  }
}

class CaloryApp extends StatelessWidget {
  const CaloryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeSelectProvider>().theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: theme,
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
      routes: Routes.routes,
    );
  }

  Future<bool?> _loadData() async {
    await Future.delayed(const Duration(milliseconds: 1000),(){});
    return PreferenceUtils.getBool(UserConstants.saveData);
  }
}
