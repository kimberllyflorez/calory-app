class UserConstants {
  static const levelActivity = 'level_activity';
  static const proteinPercent = 'protein_goal';
  static const carbPercent = 'carb_goal';
  static const fatPercent = 'fat_goal';
  static const genderData = 'gender';
  static const age = 'age';
  static const height = 'height';
  static const weight = 'weight';
  static const gainWeight = 'gain';
  static const saveData = 'save_data';
  static const userCalories = 'user_calories';
  static const themeSelect = 'theme_select';

  static const Map<int, double> activityLevels = {
    0: 1.3,
    1: 1.4,
    2: 1.5,
  };

  static const  Map<int, int> goalWeights = {
    0: -30,
    1: 0,
    2: 10,
  };
}
