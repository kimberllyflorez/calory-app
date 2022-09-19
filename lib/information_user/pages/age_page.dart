import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/widgets/button_next_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgePage extends StatefulWidget {
  const AgePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  late final TextEditingController ageController;

  @override
  void initState() {
    ageController = TextEditingController(text: '00');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('what is your age ?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    controller: ageController,
                    onChanged: (value) => _onChange(UserConstants.age, value),
                    style: const TextStyle(
                        color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
                Text('Years')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onChange(String key, String value) async {

    await PreferenceUtils.setString(key, value);
  }

  _onTap() {
    final age = int.parse(ageController.text);
    print(age);

    if (age < 2) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container( child:  Text("age not allowed ")),
      ));
      return;
    } else {
      Navigator.pushNamed(context, 'heightPage');
    }
  }
}
