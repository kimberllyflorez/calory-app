import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/ui/widgets/message_validated.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_Select_wd.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
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
    isWomen = -1;
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
            'What is your gender ?',
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
                  nameButton: 'Woman',
                  onPressed: () => _onPressedGender(0),
                  select: isWomen == 0,
                ),
                const SizedBox(width: 5),
                ButtonSelect(
                  nameButton: 'Man',
                  onPressed: () => _onPressedGender(1),
                  select: isWomen == 1,
                ),
              ],
            ),
          ),
          ButtonNext(onTap: _onTap),
        ],
      ),
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
    if (isWomen < 0 || isWomen > 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: MessageValidate(
            messageError: 'Please, select your gender',
          ),
        ),
      );
      return;
    } else {
      Navigator.pushNamed(context, 'agePage');
    }
  }
}
