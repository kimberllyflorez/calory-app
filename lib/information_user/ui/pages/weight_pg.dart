import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  late final TextEditingController weightController;

  @override
  void initState() {
    weightController = TextEditingController(text: '0');
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
          const Text(
            'What is your weight?',
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
                  controller: weightController,
                  style: const TextStyle(
                      color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 60),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              const Text(
                'Kg',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
          ButtonNext(onTap: _onTap),
        ],
      ),
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
