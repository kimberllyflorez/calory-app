import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_Select_wd.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
import 'package:calory_tracker/information_user/ui/widgets/message_validated.dart';
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
    levelActivity = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'What is your activity label ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelect(
                  nameButton: 'Low',
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
          ButtonNext(onTap: _onTap),
        ],
      ),
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
    if (levelActivity < 0 || levelActivity > 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: MessageValidate(
            messageError: 'Please,select your activity label',
          ),
        ),
      );
      return;
    } else {
      Navigator.pushNamed(context, 'goalPage');
    }
  }
}
