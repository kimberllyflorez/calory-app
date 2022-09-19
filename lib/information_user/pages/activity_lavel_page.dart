

import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/widgets/button_Selectr.dart';
import 'package:calory_tracker/information_user/widgets/button_next_widget.dart';
import 'package:flutter/material.dart';

class ActivityLabelPage extends StatefulWidget {
  const ActivityLabelPage({Key? key}) : super(key: key);

  @override
  State<ActivityLabelPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<ActivityLabelPage> {
  late int levelActivity;

  @override
  void initState() {
    levelActivity = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('what is your activity label ?'),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelect(
                  nameButton: 'low',
                  onPressed: () => _onPressedActivity(0),
                  select: levelActivity == 0,
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'Medium',
                  onPressed: () => _onPressedActivity(1),
                  select: levelActivity == 1,
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'High',
                  onPressed: () => _onPressedActivity(2),
                  select: levelActivity == 2,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onPressedActivity(int value) async {
    await PreferenceUtils.setInt(
      UserConstants.levelActivity,
      value,

    );
    setState(() {
      levelActivity = value;
    });
  }

  _onTap() {
    print(levelActivity);
    Navigator.pushNamed(context, 'goalPage');
  }
}
