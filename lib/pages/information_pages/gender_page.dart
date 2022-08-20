import 'package:calory_tracker/Widgets/button_Selectr.dart';
import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  late int gender;

  @override
  void initState() {
    gender = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('what is your gender ?'),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelect(
                  nameButton: 'women',
                  onPressed: () => _onPressedGender(0),
                  select: gender == 0,

                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'man',
                  onPressed: ()=> _onPressedGender(1),
                  select: gender == 1,
                ),
              ],
            ),
          ),

        ],
      ),
      floatingActionButton:  ButtonNext(onTap: _onTap),
    );
  }
  _onPressedGender(int value) async {
    await PreferenceUtils.setBool(
      UserConstants.genderData,
      gender == 1 ? false : true,
    );
    setState(() {
      gender = value;
    });
  }
  _onTap(){
    Navigator.pushNamed(context, 'agePage');
  }
}








