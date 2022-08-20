import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
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
    ageController = TextEditingController(text: '10');
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
          Text('what is your age ?'),
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
                        color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
                Text('years')
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

    if (age <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container( child:  Text("Sending Message")),
      ));
      return;
    } else {
      Navigator.pushNamed(context, 'heightPage');
    }
  }
}
