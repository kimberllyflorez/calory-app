import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/information_user/models/information_user_model.dart';


class UserPreferencesHelper {
  Future<UserInfoModel> getUserInfoModel() async {
    final age = await _getAge();
    final weight = await _getWeight();
    final height = await _getHeight();
    final gender = await _getGender();
    final activityLevel = await _getActivityLevel();
    final goalWeight = await _getGoalWeight();
    final userCalories = await _getUserCalories();

    return UserInfoModel(
      age: age,
      weight: weight,
      height: height,
      gender: gender,
      activityLevel: activityLevel,
      goalWeight: goalWeight,
      userCalories: userCalories,
    );
  }

  Future<void> setUserInfoModel(UserInfoModel userInfo) async {
    await setAge(userInfo.age.toString());
    await setWeight(userInfo.weight);
    await setHeight(userInfo.height.toString());
    await setGender(userInfo.gender);
    await setActivityLevel(userInfo.activityLevel);
    await setGoalWeight(userInfo.goalWeight);
    await setUserCalories(userInfo.userCalories);
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

  Future _getUserCalories() async {
    return await PreferenceUtils.getDouble(UserConstants.userCalories);
  }

  Future<bool> getUserHasData() async {
    return await PreferenceUtils.getBool(UserConstants.saveData) ?? false;
  }

  Future setWeight(double weight) async {
    await PreferenceUtils.setDouble(UserConstants.weight, weight);
  }

  Future setHeight(String height) async {
    await PreferenceUtils.setString(UserConstants.height, height);
  }

  Future setGender(bool isWomen) async {
    await PreferenceUtils.setBool(UserConstants.genderData, isWomen);
  }

  Future<void> setAge(String age) async {
    await PreferenceUtils.setString(UserConstants.age, age);
  }

  Future setActivityLevel(int levelActivity) async {
    await PreferenceUtils.setInt(UserConstants.levelActivity, levelActivity);
  }

  Future setGoalWeight(int gainWeight) async {
    await PreferenceUtils.setInt(UserConstants.gainWeight, gainWeight);
  }

  Future setUserCalories(double calories) async {
    await PreferenceUtils.setDouble(UserConstants.userCalories, calories) ?? false;
  }
}
