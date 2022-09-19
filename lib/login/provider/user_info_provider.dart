
import 'package:calory_tracker/information_user/models/information_user_model.dart';
import 'package:calory_tracker/information_user/models/user_repository.dart';
import 'package:calory_tracker/information_user/provider/user_preferences_helper.dart';
import 'package:calory_tracker/login/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  final AuthRepository? authRepository;
  late final UserRepository _userRepository;
  UserInfoModel userInfo = UserInfoModel();
  bool userHasInitialData = false;

  UserDataProvider({
    this.authRepository,
  }) {
    _userRepository = UserRepository();
  }

  Future loadUserInfoData() async {
    await _getUserDataFromLocal();
  }

  Future loadInitialUserData() async {
    final helper = UserPreferencesHelper();
    userHasInitialData = await helper.getUserHasData();
    if (userHasInitialData) {
      await _getUserDataFromLocal();
    } else {
      await _getUserInfoFromDB();
    }
    return userHasInitialData;
  }

  Future<void> _getUserDataFromLocal() async {
    final helper = UserPreferencesHelper();
    userInfo = await helper.getUserInfoModel();
    userHasInitialData = true;
    notifyListeners();
  }

  Future saveUserInfo() async {
    await _saveUserInfo();
  }

  Future<void> _getUserInfoFromDB() async {
    final helper = UserPreferencesHelper();
    userInfo = await _getUserInfo();
    await helper.setUserInfoModel(userInfo);
    userHasInitialData = true;
    notifyListeners();
  }

  void clean(){
    userInfo = UserInfoModel();
    userHasInitialData = false;
  }

  @override
  void dispose() {
    clean();
    super.dispose();
  }
}

extension _UserDataProvider on UserDataProvider {
  Future<bool> _saveUserInfo() async {
    final userId = await authRepository?.getUserId() ?? '';
    return await _userRepository.saveUserData(userId, userInfo);
  }

  Future<UserInfoModel> _getUserInfo() async {
    final userId = await authRepository?.getUserId() ?? '';
    return await _userRepository.getUserData(userId);
  }
}
