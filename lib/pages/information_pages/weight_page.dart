import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:flutter/material.dart';

class weightPage extends StatelessWidget {
  const weightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('what is your weight?'),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    initialValue: '80.0',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text('Kg')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'activityLabelPage'),
    );
  }
}
