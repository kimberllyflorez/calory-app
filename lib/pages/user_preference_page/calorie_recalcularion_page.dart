import 'package:calory_tracker/Widgets/button_Selectr.dart';
import 'package:calory_tracker/constants/user_constants.dart';
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

  @override
  void initState() {
    final userInfo = context.read<UserDataProvider>().userInfo;
    controllerAge = TextEditingController(text: userInfo.age.toString());
    controllerHeight = TextEditingController(text: userInfo.height.toString());
    controllerWeight = TextEditingController(text: userInfo.weight.toString());
    controllerGender = userInfo.gender ? 0 : 1;
    controllerActivity = userInfo.activityLevel;
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
              iconData: const Icon(PhosphorIcons.baby_fill,
                color: AppTheme.formColor,
              ),
              value: 2,
              controller: controllerAge,
              nameForm: 'introduct your Age',
            ),
            ItemForm(
              iconData: const Icon(PhosphorIcons.person_fill,
                color: AppTheme.formColor,
              ),
              value: 3,
              controller: controllerHeight,
              nameForm: 'introduct your Height',
            ),
            ItemForm(
              iconData: const Icon(PhosphorIcons.barbell_fill,
                color: AppTheme.formColor,
              ),
              value: 3,
              controller: controllerWeight,
              nameForm: 'introduct your weight',
            ),
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
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        child: const ButtonNext(),
      ),
    );
  }

  _onPressedGender(int value) async {
    await PreferenceUtils.setBool(
      UserConstants.genderData,
      controllerGender == 1 ? false : true,
    );
    setState(() {
      controllerGender = value;
    });
    await context.read<UserDataProvider>().getData();
  }

  _onPressedActivity(int value) async {
    await PreferenceUtils.setInt(
      UserConstants.levelActivity,
      value,
    );
    setState(() {
      controllerActivity = value;
    });
    await context.read<UserDataProvider>().getData();
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
          margin: const EdgeInsets.only(left: 16),
          child: Row(
            children: const [
              Icon(
                PhosphorIcons.gender_intersex_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 10),
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
          margin: const EdgeInsets.only(left: 16),
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
              select: selected == 2 ,
            ),
          ],
        ),
      ],
    );
  }
}

class ItemForm extends StatelessWidget {
  final TextEditingController? controller;
  final int? value;
  final String nameForm;
  final Icon iconData;
  final String? initialValue;

  const ItemForm({
    Key? key,
    required this.iconData,
    required this.nameForm,
    this.initialValue,
    this.controller,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: TextFormField(
        initialValue: initialValue,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          icon: iconData,
          iconColor: AppTheme.formColor,
          labelText: nameForm,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(value ?? 6),
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
              PhosphorIcons.arrow_bend_up_left,
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
