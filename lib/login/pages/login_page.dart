
import 'package:calory_tracker/login/pages/login_input_decoration.dart';
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
      Navigator.pushReplacementNamed(context, userHasInitialData ? 'calculatorFood' : 'helloPage');
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

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.white30,
      color: Colors.white12,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const ColorBox(),
          Positioned(
            child: const IconPerson(),
            top: size.height * 0.05,
            left: size.height * 0.05,
            right: size.height * 0.05,
          ),
          child,
        ],
      ),
    );
  }
}

class IconPerson extends StatelessWidget {
  const IconPerson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30),
      child: const Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4ECDC4), //Color(0xffb993d6), //cd9a7c7////c2e59c
            Color(0xFF556270) //Color(0xff8ca6db), //#//fffcdc////64b3f4
          ],
        ),
      ),
    );
  }
}
