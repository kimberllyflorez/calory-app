

import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/widgets/button_Selectr.dart';
import 'package:calory_tracker/information_user/widgets/button_next_widget.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  late int isWomen;

  @override
  void initState() {
    isWomen = 0;
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
                  select: isWomen == 0,
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'man',
                  onPressed: () => _onPressedGender(1),
                  select: isWomen == 1,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onPressedGender(int value) async {
    await PreferenceUtils.setBool(
      UserConstants.genderData,
      isWomen == 0,
    );
    setState(() {
      isWomen = value;
    });
  }

  _onTap() {
    Navigator.pushNamed(context, 'agePage');
  }
}

//
//_onChanged(String key, String value) async {
//     await PreferenceUtils.setString(key, value);
//   }
//
//   _onTap() async {
//     final carbPercent = int.parse(carbController.text);
//     final fatPercent = int.parse(fatController.text);
//     final proteinPercent = int.parse(proteinController.text);
//     final totalPercent = (carbPercent + fatPercent + proteinPercent);
//     if (totalPercent != 100) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("the total percent must be 100"),
//       ));
//       return;
//     }
//     await PreferenceUtils.setBool(UserConstants.saveData, true);
//     await _calcCalories();
//     Navigator.pushNamed(context, 'calculatorFood');
//   }
