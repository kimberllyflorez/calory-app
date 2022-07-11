import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);


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
              children: const  [
                ButtonSelect(nameButton: 'lose'),
                SizedBox(width: 5),
                ButtonSelect(nameButton: 'Keep'),
                SizedBox(width: 5),
                ButtonSelect(nameButton: 'Gain'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const ButtonNext(nextPage: 'nutrientGoal'),
    );
  }
}


