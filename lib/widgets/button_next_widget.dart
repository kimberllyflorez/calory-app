import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final void Function()? onTap;

  const ButtonNext({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: () async {
      //
      //   print('${UserConstants.levelActivity.toString()} ${await PreferenceUtils.getString(UserConstants.levelActivity)}');
      //   print('${UserConstants.proteinGoal.toString()} ${await PreferenceUtils.getString(UserConstants.proteinGoal)}');
      //   print('${UserConstants.fatGoal.toString()} ${await PreferenceUtils.getString(UserConstants.fatGoal)}');
      //   print('${UserConstants.carbGoal.toString()} ${await PreferenceUtils.getString(UserConstants.carbGoal)}');
      //   print('${UserConstants.age.toString()} ${await PreferenceUtils.getString(UserConstants.age)}');
      //   print('${UserConstants.genderData.toString()} ${await PreferenceUtils.getString(UserConstants.genderData)}');
      //   print('${UserConstants.genderData.toString()} ${await PreferenceUtils.getString(UserConstants.height)}');
      //   print('${UserConstants.goalWeight.toString()} ${await PreferenceUtils.getString(UserConstants.gainWeignt)}');
      //
      //
      //   final call = onTap;
      //   if (call != null) {
      //     call();
      //   }
      //   Navigator.pushNamed(context, nextPage ?? 'firstPage');
      //
      // },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.green,
        ),
        width: 80,
        height: 50,
        child: const Center(
          child: Text('Next'),
        ),
      ),
    );
  }
}
