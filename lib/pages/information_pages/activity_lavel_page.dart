import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class ActivityLabelPage extends StatefulWidget {
  const ActivityLabelPage({Key? key}) : super(key: key);

  @override
  State<ActivityLabelPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<ActivityLabelPage> {
  //final List<String> buttons = ['women', 'men'];
  final bool select = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('what is your activity label ?'),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const  [
                ButtonSelect(nameButton: 'low'),
                SizedBox(width: 5),
                ButtonSelect(nameButton: 'Medium'),
                SizedBox(width: 5),
                ButtonSelect(nameButton: 'High'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'goalPage'),
    );
  }
}


