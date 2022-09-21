
import 'package:calory_tracker/information_user/ui/widgets/app_bar_login_wd.dart';
import 'package:calory_tracker/login/ui/widget/login_input_decoration.dart';
import 'package:calory_tracker/login/provider/login_provider.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';
import 'package:calory_tracker/login/repository/auth_repository.dart';
import 'package:calory_tracker/login/repository/notification_repository.dart';
import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/products/providers/products_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              children: const [
                CardContainer(),
                SizedBox(
                  height: 50,
                ),
                ButtonCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonCreateAccount extends StatelessWidget {
  const ButtonCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, 'register'),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          AppTheme.primary.withOpacity(0.5),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: const Text(
        "Don't have account",
        style: TextStyle(color: AppTheme.primary),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);
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
          const SizedBox(
            height: 20,
          ),
          const Text(
            'login_pages',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const _LoginForm(),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () => _onPressedLogin(context, productsProvider),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: AppTheme.primary,
            child: Text(loginForm.isLoaging ? 'Loading' : 'Sign in'),
          ),
        ],
      ),
    );
  }

  void _onPressedLogin(BuildContext context, ProductsProvider productsProvider) async {
    FocusScope.of(context).unfocus();
    final loginForm = Provider.of<LoginFormProvider>(context, listen: false);
    final authService = Provider.of<AuthRepository>(context, listen: false);
    final String? errorMessage = await authService.loginUser(loginForm.email, loginForm.password);

    if (!loginForm.isValidateLoginKey()) return;
    loginForm.isLoading = true;

    if (errorMessage == null) {
      final userHasInitialData = await context.read<UserDataProvider>().loadInitialUserData();
      await productsProvider.loadProductsFromDB();
      Navigator.pushReplacementNamed(context, userHasInitialData ? 'home' : 'helloPage');
    } else {
      NotificationRepository.showSnackbar(errorMessage);
    }
    loginForm.isLoading = false;
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
        key: loginForm.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppTheme.primary,
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
                if (value != null && value.length >= 6) return null;
                return 'Your password should most be 6 characters ';
              },
            ),
          ],
        ),
      ),
    );
  }
}
