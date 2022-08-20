import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

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
          Text('Do you want to lose, keep or gain weight?'),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                ButtonSelect(
                    nameButton: 'lose',
                    select: goalWeight == 0,
                    onPressed: ()=> _onPressed(0),
                ),
                SizedBox(
                    width: 5
                ),
                ButtonSelect(
                    nameButton: 'Keep',
                  select: goalWeight == 1,
                  onPressed: ()=> _onPressed(1),

                ),
                SizedBox(width: 5),
                ButtonSelect(
                    nameButton: 'Gain',
                  select: goalWeight == 2,
                  onPressed:()=> _onPressed(2),

                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap ),
    );
  }

  _onPressed(int value) async {
    await PreferenceUtils.setInt(
      UserConstants.gainWeight,
      value
    );
    setState(() {
      goalWeight = value;
    });
  }
  _onTap(){
    Navigator.pushNamed(context, 'nutrientGoal');

  }
}


