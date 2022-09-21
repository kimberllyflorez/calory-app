
import 'package:calory_tracker/calorie_calculator/ui/widgets/widget.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';



class CalorieRecalculationPage extends StatefulWidget {
  const CalorieRecalculationPage({Key? key}) : super(key: key);

  @override
  State<CalorieRecalculationPage> createState() => _CalorieRecalculationPageState();
}

class _CalorieRecalculationPageState extends State<CalorieRecalculationPage> {
  late final TextEditingController controllerAge;
  late final TextEditingController controllerHeight;
  late final TextEditingController controllerWeight;
  late int controllerGender;
  late int controllerActivity;
  late int controllerGoalWeight;

  @override
  void initState() {
    final userInfo = context.read<UserDataProvider>().userInfo;
    controllerAge = TextEditingController(text: userInfo.age.toString());
    controllerHeight = TextEditingController(text: userInfo.height.toString());
    controllerWeight = TextEditingController(text: userInfo.weight.toString());
    controllerGender = userInfo.gender ? 0 : 1;
    controllerActivity = userInfo.activityLevel;
    controllerGoalWeight = userInfo.goalWeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomerAppBar(),
            const SizedBox(height: 10),
            ItemForm(
              iconData: const Icon(
                PhosphorIcons.baby_fill,
                color: AppTheme.formColor,
              ),
              valueValidate: 2,
              controller: controllerAge,
              nameForm: 'Enter your Age',
              onChanged: (value) => _onChangedString(
                UserConstants.age,
                value,
              ),
            ),
            ItemForm(
              iconData: const Icon(
                PhosphorIcons.person_fill,
                color: AppTheme.formColor,
              ),
              valueValidate: 3,
              controller: controllerHeight,
              nameForm: 'Enter  your Height',
              onChanged: (value) => _onChangedString(
                UserConstants.height,
                value,
              ),
            ),
            ItemForm(
              iconData: const Icon(
                PhosphorIcons.barbell_fill,
                color: AppTheme.formColor,
              ),
              valueValidate: 3,
              controller: controllerWeight,
              nameForm: 'Enter your weight',
              onChanged: (value) => _onChangedDouble(UserConstants.weight, value),
            ),
            const SizedBox(height: 4),
            GenderSelector(
              selected: controllerGender,
              onPressed: _onPressedGender,
            ),
            const Divider(
              indent: 50,
              endIndent: 16,
              thickness: 2,
            ),
            ActivitySelector(
              selected: controllerActivity,
              onPressed: _onPressedActivity,
            ),
            const Divider(
              indent: 50,
              endIndent: 16,
              thickness: 2,
            ),
            GoalWeight(
              onPressed: _onPressedGoal,
              selected: controllerGoalWeight,
            ),
            const Divider(
              indent: 50,
              endIndent: 16,
              thickness: 2,
            ),
            const ButtonSaveRecalculator()
          ],
        ),
      ),
    );
  }

  _onChangedString(String key, String value) async {
    await PreferenceUtils.setString(key, value);
    setState(() {
      value;
    });
  }

  _onChangedDouble(String key, String value) async {
    final double weight = double.tryParse(controllerWeight.text) ?? 0.0;
    await PreferenceUtils.setDouble(key, weight);
  }

  _onPressedGender(int value) async {
    final isWomen = value == 0;
    await PreferenceUtils.setBool(UserConstants.genderData, isWomen);
    setState(() {
      controllerGender = value;
    });
  }

  _onPressedActivity(int value) async {
    await PreferenceUtils.setInt(UserConstants.levelActivity, value);
    setState(() {
      controllerActivity = value;
    });
  }

  _onPressedGoal(int value) async {
    await PreferenceUtils.setInt(UserConstants.gainWeight, value);
    setState(() {
      controllerGoalWeight = value;
    });
  }
}










