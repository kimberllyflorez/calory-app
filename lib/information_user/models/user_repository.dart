import 'dart:developer';

import 'package:calory_tracker/information_user/models/information_user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class UserRepository {
  Future<bool> saveUserData(String userId, UserInfoModel userModel) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("$userId/user_info/");
      await ref.update(userModel.toMap());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<UserInfoModel> getUserData(String userId) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('$userId/user_info').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        return UserInfoModel(
          weight: (data['weight'] as int).toDouble(),
          height: (data['height'] as int).toDouble(),
          goalWeight: data['goal_weight'],
          gender: data['gender'],
          activityLevel: data['activity_level'],
          age: data['age'],
          userCalories: data['user_calories'],
        );
      } else {
        print('No data available.');
      }
      return UserInfoModel();
    } catch (e) {
      log(e.toString());
      return UserInfoModel();
    }
  }
}
