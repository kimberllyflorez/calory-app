import 'package:calory_tracker/core/helpers/preference.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/constants/user_constants.dart';
import 'package:calory_tracker/information_user/ui/widgets/app_bar_login_wd.dart';
import 'package:calory_tracker/login/ui/widget/login_input_decoration.dart';
import 'package:calory_tracker/login/provider/login_provider.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';
import 'package:calory_tracker/login/repository/auth_repository.dart';
import 'package:calory_tracker/login/repository/notification_repository.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CardContainer(),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      AppTheme.primary.withOpacity(0.5),
                    ),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ),
                  child: const Text(
                    'Already have account',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 30, left: 30),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Create account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const _LoginForm(),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () => _onPressedLogin(context),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: AppTheme.primary,
            child: Text(loginForm.isLoaging ? 'Loading' : 'Register'), //
          ),
        ],
      ),
    );
  }

  void _onPressedLogin(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final loginForm = Provider.of<LoginFormProvider>(context, listen: false);
    if (!loginForm.isValidateRegisterKey()) return;
    loginForm.isLoading = true;

    final authRepository = Provider.of<AuthRepository>(context, listen: false);
    final bool userHasInitialData = await _loadUserData() ?? false;
    final String? errorMessage =
        await authRepository.createUser(loginForm.email, loginForm.password);

    if (errorMessage == null) {
      if (userHasInitialData) {
        context.read<UserDataProvider>().loadUserInfoData();
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        Navigator.pushReplacementNamed(context, 'helloPage');
      }
    } else {
      NotificationRepository.showSnackbar(errorMessage);
    }
    loginForm.isLoading = false;
  }

  Future<bool?> _loadUserData() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return await PreferenceUtils.getBool(UserConstants.saveData);
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: Form(
        key: loginForm.registerFormKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authDecoration(
                hintText: 'email@email.com',
                labeText: 'Email',
                prefixIcon: Icons.email,
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'invalidate email';
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authDecoration(
                labeText: 'password',
                hintText: '*******',
                prefixIcon: Icons.lock,
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'Your password should most be 6 characters ';
              },
            ),
          ],
        ),
      ),
    );
  }
}