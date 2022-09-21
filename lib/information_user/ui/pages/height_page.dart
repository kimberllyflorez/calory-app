import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';

import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/ui/widgets/message_validated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  late final TextEditingController heightController;

  @override
  void initState() {
    heightController = TextEditingController(text: '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'What is your Height?',
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
                    controller: heightController,
                    style: const TextStyle(
                        color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      //hoverColor: Colors.green,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) => _onPressed(UserConstants.height, value),
                  ),
                ),
                const Text(
                  'Cm',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            ),
            ButtonNext(onTap: _onTap),
          ],
        ),
      ),
    );
  }

  _onPressed(String key, value) async {
    await PreferenceUtils.setString(key, value);
  }

  _onTap() {
    final height = int.parse(heightController.text);
    print(height);
    if (height <= 10 || height > 400) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: MessageValidate(messageError: 'verify your height',),
      ));
      return;
    } else {
      Navigator.pushNamed(context, 'weightPage');
    }
  }
}
