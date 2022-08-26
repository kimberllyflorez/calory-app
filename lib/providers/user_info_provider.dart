import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/model/model_user_info.dart';
import 'package:calory_tracker/pages/information_pages/weight_page.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  UserInfoModel userInfo = UserInfoModel();

  Future getData() async {
    final age = await _getAge();
    final weight = await _getWeight();
    final height = await _getHeight();
    final gender = await _getGender();
    final activityLevel = await _getActivityLevel();
    final goalWeight = await _getGoalWeight();

    userInfo = UserInfoModel(
      age: age,
      weight: weight,
      height: height,
      gender: gender,
      activityLevel: activityLevel,
      goalWeight: goalWeight,
    );
    notifyListeners();
  }

  Future _getWeight() async {
    return await PreferenceUtils.getDouble(UserConstants.weight);
  }

  Future _getHeight() async {
    final value = await PreferenceUtils.getString(UserConstants.height);
    return double.parse(value);
  }

  Future _getGender() async {
    final data = await PreferenceUtils.getBool(UserConstants.genderData);
    return data ?? false;
  }

  Future<int> _getAge() async {
    final value = await PreferenceUtils.getString(UserConstants.age);
    return int.parse(value);
  }

  Future _getActivityLevel() async {
    return await PreferenceUtils.getInt(UserConstants.levelActivity);
  }

  Future _getGoalWeight() async {
    return await PreferenceUtils.getInt(UserConstants.gainWeight);
  }
}
