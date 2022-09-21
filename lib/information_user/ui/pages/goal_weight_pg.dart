import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_Select_wd.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  late int goalWeight;

  @override
  void initState() {
    goalWeight = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Do you want to lose, keep or gain weight?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelect(
                  nameButton: 'Lose',
                  select: goalWeight == 0,
                  onPressed: () => _onPressed(0),
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'Keep',
                  select: goalWeight == 1,
                  onPressed: () => _onPressed(1),
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'Gain',
                  select: goalWeight == 2,
                  onPressed: () => _onPressed(2),
                ),
              ],
            ),
          ),
          ButtonNext(onTap: _onTap),
        ],
      ),
    );
  }

  _onPressed(int value) async {
    await PreferenceUtils.setInt(
      UserConstants.gainWeight,
      value,
    );
    setState(() {
      goalWeight = value;
    });
    print('find$goalWeight');
  }

  _onTap() {
    Navigator.pushNamed(context, 'nutrientGoal');
  }
}
