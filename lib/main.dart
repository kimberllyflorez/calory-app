
import 'package:calory_tracker/core/routes/routes.dart';
import 'package:calory_tracker/core/theme/theme_modo_provider.dart';
import 'package:calory_tracker/login/pages/login_page.dart';
import 'package:calory_tracker/login/provider/login_provider.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';
import 'package:calory_tracker/login/repository/auth_repository.dart';
import 'package:calory_tracker/login/repository/notification_repository.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'products/providers/food_provider.dart';
import 'products/providers/products_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthRepository()),
        ChangeNotifierProvider(create: (_) => FoodProvider()),
        ChangeNotifierProvider(create: (_) => ThemeSelectProvider()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProxyProvider<AuthRepository, UserDataProvider>(
          create: (_) => UserDataProvider(),
          update: (_, authRepository, __) => UserDataProvider(authRepository: authRepository),
        ),
        ChangeNotifierProxyProvider<AuthRepository, ProductsProvider>(
          create: (_) => ProductsProvider(),
          update: (_, authRepository, __) => ProductsProvider(authRepository: authRepository),
        ),
      ],
      child: const CalorieApp(),
    );
  }
}

class CalorieApp extends StatelessWidget {
  const CalorieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeSelectProvider>().theme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: theme,
      home: const LoginScreen(),
      initialRoute: 'cheackAuth',
      scaffoldMessengerKey: NotificationRepository.messengerKey,
      routes: Routes.routes,
    );
  }
}