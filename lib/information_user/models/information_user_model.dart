import 'dart:convert';

UserInfoModel userInfoModelFromMap(String str) => UserInfoModel.fromMap(json.decode(str));

String userInfoModelToMap(UserInfoModel data) => json.encode(data.toMap());

class UserInfoModel {

  final double weight;
  final bool gender;
  final double height;
  final int age;
  final int activityLevel;
  final int goalWeight;
  final double userCalories;

  UserInfoModel({
    this.weight = 0.0,
    this.gender = false,
    this.height = 0.0,
    this.age = 0,
    this.activityLevel = 0,
    this.goalWeight = 0,
    this.userCalories = 0,
  });

  factory UserInfoModel.fromMap(Map<String, dynamic> json) => UserInfoModel(
    weight: json["weight"],
    gender: json["gender"],
    height: json["height"],
    age: json["age"],
    activityLevel: json["activity_level"],
    goalWeight: json["goal_weight"],
    userCalories: json["user_calories"],
  );

  Map<String, dynamic> toMap() => {
    "weight": weight,
    "gender": gender,
    "height": height,
    "age": age,
    "activity_level": activityLevel,
    "goal_weight": goalWeight,
    "user_calories": userCalories,
  };
}
