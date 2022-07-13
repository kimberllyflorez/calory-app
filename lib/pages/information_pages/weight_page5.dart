import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/material.dart';

class weightPage extends StatefulWidget {
  const weightPage({Key? key}) : super(key: key);

  @override
  State<weightPage> createState() => _weightPageState();
}

class _weightPageState extends State<weightPage> {
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
                    onChanged: (value) => _onPressed (UserConstants.weight, value),
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: const  InputDecoration(
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
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onPressed(String key, String value){
    PreferenceUtils.setString(key, value);
  }

  _onTap(){
    Navigator.pushNamed(context, 'activityLabelPage');
  }
}
