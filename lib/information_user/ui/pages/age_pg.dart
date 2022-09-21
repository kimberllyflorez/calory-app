import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
import 'package:calory_tracker/information_user/ui/widgets/message_validated.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

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
    ageController = TextEditingController(text: '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'What is your age ?',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
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
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const Text(
                  'Years',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            ButtonNext(onTap: _onTap),
          ],
        ),
      ),
    );
  }

  _onChange(String key, String value) async {
    await PreferenceUtils.setString(key, value);
  }

  _onTap() {
    final age = int.parse(ageController.text);
    print(age);

    if (age < 10 || age > 99) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: MessageValidate(
          messageError: 'the age admitted is invalid',
        ),
      ));
      return;
    } else {
      Navigator.pushNamed(context, 'heightPage');
    }
  }
}
