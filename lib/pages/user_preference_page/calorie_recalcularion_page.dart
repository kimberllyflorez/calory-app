import 'package:calory_tracker/Widgets/button_Selectr.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/controllers/calorie_controller.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:calory_tracker/widgets/widgets.dart';
import 'package:calory_tracker/providers/user_info_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            _GenderSelector(
              selected: controllerGender,
              onPressed: _onPressedGender,
            ),
            const Divider(
              indent: 50,
              endIndent: 16,
              thickness: 2,
            ),
            _ActivitySelector(
              selected: controllerActivity,
              onPressed: _onPressedActivity,
            ),
            const Divider(
              indent: 50,
              endIndent: 16,
              thickness: 2,
            ),
            _GoalWeight(onPressed:_onPressedGoal, selected: controllerGoalWeight,)

          ],
        ),
      ),
      floatingActionButton: const _ButtonSave(),
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

class _GenderSelector extends StatelessWidget {
  final int selected;
  final Function(int) onPressed;

  const _GenderSelector({
    Key? key,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: const [
              Icon(
                PhosphorIcons.gender_intersex_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 12),
              Text(
                'Select your gender ',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSelect(
              nameButton: 'women',
              onPressed: () => onPressed(0),
              select: selected == 0,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              nameButton: 'man',
              onPressed: () => onPressed(1),
              select: selected == 1,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActivitySelector extends StatelessWidget {
  final int selected;
  final Function(int) onPressed;

  const _ActivitySelector({
    Key? key,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: const [
              Icon(
                PhosphorIcons.person_simple_run_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 10),
              Text(
                'Select your activity lavel ',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSelect(
              nameButton: 'low',
              onPressed: () => onPressed(0),
              select: selected == 0,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              nameButton: 'Medium',
              onPressed: () => onPressed(1),
              select: selected == 1,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              nameButton: 'High',
              onPressed: () => onPressed(2),
              select: selected == 2,
            ),
          ],
        ),
      ],
    );
  }
}

class _GoalWeight extends StatelessWidget {
  final int selected;
  final Function(int) onPressed;

  const _GoalWeight({
    Key? key,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: const [
              Icon(
                PhosphorIcons.person_simple_run_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 10),
              Text(
                'Select your goald ',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSelect(
              nameButton: 'lose',
              onPressed: () => onPressed(0),
              select: selected == 0,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              nameButton: 'keep',
              onPressed: () => onPressed(1),
              select: selected == 1,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              nameButton: 'gain',
              onPressed: () => onPressed(2),
              select: selected == 2,
            ),
          ],
        ),
      ],
    );
  }
}


class ItemForm extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int? valueValidate;
  final String nameForm;
  final Icon iconData;
  final String? initialValue;

  const ItemForm({
    Key? key,
    required this.iconData,
    required this.nameForm,
    this.initialValue,
    this.controller,
    this.valueValidate,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          icon: iconData,
          iconColor: AppTheme.formColor,
          labelText: nameForm,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(valueValidate ?? 6),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class CustomerAppBar extends StatelessWidget {
  const CustomerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          )),
          width: double.infinity,
          child: Image.asset(
            'assets/posterBanner.jpeg',
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
        Positioned(
          top: 130,
          left: 10,
          child: IconButton(
            icon: const Icon(
              PhosphorIcons.arrow_bend_up_left_fill,
              size: 45,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

class _ButtonSave extends StatelessWidget {
  const _ButtonSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final CalorieController calorieController = CalorieController();
        await calorieController.setAndCalcCaloriesData();
        Navigator.pushNamed(context, 'calculatorFood');
        await context.read<UserDataProvider>().loadUserInfoData();
        await context.read<UserDataProvider>().saveUserInfo();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.formColor,
          borderRadius: BorderRadius.circular(25),
        ),
        width: 80,
        height: 50,
        child: const Center(
          child: Text('Save'),
        ),
      ),
    );
  }
}
