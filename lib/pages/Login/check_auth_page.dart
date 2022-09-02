import 'package:calory_tracker/controllers/calorie_controller.dart';
import 'package:calory_tracker/pages/pages.dart';
import 'package:calory_tracker/providers/products_provider.dart';
import 'package:calory_tracker/providers/user_info_provider.dart';
import 'package:calory_tracker/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthRepository>(context, listen: false);
    final userProvider = Provider.of<UserDataProvider>(context, listen: false);
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);
    return FutureBuilder(
      future: authService.isAuthentication(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          if (snapshot.data == '') {
            return const LoginScreen();
          } else {
            return FutureBuilder(
              future: _loadData(userProvider, productsProvider),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final result = snapshot.data ?? false;
                if (result) {
                  return const HomePage();
                }
                return const HelloPage();
              },
            );
          }
        }
        return Container(
          color: Colors.white,
          child: const Scaffold(
            body: Center(
              child: Text('Loading ...'),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _loadData(UserDataProvider provider, ProductsProvider productsProvider ) async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    final CalorieController calorieController = CalorieController();
    await calorieController.setAndCalcCaloriesData();
    final hasData = await provider.loadInitialUserData();
    await productsProvider.loadProductsFromDB();
    return hasData;

  }
}
