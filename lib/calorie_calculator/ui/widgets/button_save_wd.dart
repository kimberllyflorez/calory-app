import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/controllers/calorie_controller.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonSaveRecalculator extends StatelessWidget {
  const ButtonSaveRecalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final CalorieController calorieController = CalorieController();
        await calorieController.setAndCalcCaloriesData();
        Navigator.pushNamed(context, 'home');
        await context.read<UserDataProvider>().loadUserInfoData();
        await context.read<UserDataProvider>().saveUserInfo();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: AppTheme.formColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
        ),

        child: const Center(
          child: Text('Save ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}