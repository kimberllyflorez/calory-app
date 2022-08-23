import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';

class weightPage extends StatefulWidget {
  const weightPage({Key? key}) : super(key: key);

  @override
  State<weightPage> createState() => _weightPageState();
}

class _weightPageState extends State<weightPage> {
  late final TextEditingController weightController;

  @override
  void initState() {
    weightController = TextEditingController(text: '80');
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
          Text('what is your weight?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    controller: weightController,
                    style: const TextStyle(
                        color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Text('Kg')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap),
    );
  }

  _onTap() async {
    final weight = double.tryParse(weightController.text) ?? 0.0;
    await PreferenceUtils.setDouble(UserConstants.weight, weight);

    if (weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(child: const Text("Weight is not 0 ")),
      ));
      return;
    } else {
      Navigator.pushNamed(context, 'activityLabelPage');
    }
  }
}
