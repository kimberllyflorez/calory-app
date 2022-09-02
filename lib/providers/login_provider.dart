import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoaging => _isLoading;

  set isLoading (bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidateLoginKey() {
    print(loginFormKey.currentState?.validate());
    print('$email - $password');
    return loginFormKey.currentState?.validate() ?? false;
  }

  bool isValidateRegisterKey() {
    print(registerFormKey.currentState?.validate());
    print('$email - $password');
    return registerFormKey.currentState?.validate() ?? false;
  }
}
