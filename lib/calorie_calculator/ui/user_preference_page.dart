import 'package:calory_tracker/calorie_calculator/ui/backgraoun_image_profil_Widget.dart';
import 'package:calory_tracker/core/theme/theme_modo_provider.dart';
import 'package:calory_tracker/login/provider/user_info_provider.dart';
import 'package:calory_tracker/login/repository/auth_repository.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class UserPreferencePage extends StatelessWidget {
  final double width;

  const UserPreferencePage({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<AuthRepository>(context, listen: false);
    final theme = context.watch<ThemeSelectProvider>().getThemeBool();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackgroundImageProfile(
              width: width,
            ),
            const DataProfile(),
            DayNightSwitcher(
              isDarkModeEnabled: theme,
              onStateChanged: (_) => onStateChanged(context, false),
            ),
            IconButton(
              onPressed: () {
                context.read<UserDataProvider>().clean();
                authRepository.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: Icon(Icons.login_outlined),
            ),
          ],
        ),
      ),
    );
  }

  void onStateChanged(BuildContext context, bool isDarkModeEnabled) {
    final theme = Provider.of<ThemeSelectProvider>(context, listen: false);
    theme.changeMode();
  }
}

class DataProfile extends StatelessWidget {
  const DataProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ProfileButtons(
          iconName: buttonsProfilList[index].nameButton,
          iconButton: buttonsProfilList[index].iconButton,
          route: buttonsProfilList[index].routeNavigator,
        );
      },
      itemCount: buttonsProfilList.length,
    );
  }
}

class ProfileButtons extends StatelessWidget {
  final String iconName;
  final IconData iconButton;
  final String? route;

  const ProfileButtons({
    Key? key,
    required this.iconButton,
    required this.iconName,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconButton),
          Expanded(
              child: Text(
            iconName,
            textAlign: TextAlign.center,
          )),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, route ?? 'calculatorFood'),
            //todo hacer la rutas
            icon: const Icon(
              PhosphorIcons.arrow_bend_up_right,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButtonModel {
  final String nameButton;
  final IconData iconButton;
  final String? routeNavigator;

  ProfileButtonModel({
    required this.nameButton,
    required this.iconButton,
    this.routeNavigator,
  });
}

final buttonsProfilList = <ProfileButtonModel>[
  ProfileButtonModel(
    nameButton: 'caloric recalculation',
    iconButton: PhosphorIcons.calculator_fill,
    routeNavigator: 'calorierecalculation',
  ),
  ProfileButtonModel(
    nameButton: 'About me ',
    iconButton: PhosphorIcons.user_circle_gear_fill,
    routeNavigator: 'calculatorFood',
  ),
  ProfileButtonModel(
    nameButton: 'my calendar',
    iconButton: PhosphorIcons.calendar_check_fill,
    routeNavigator: 'calculatorFood',
  ),
  ProfileButtonModel(
    nameButton: 'supplements',
    iconButton: PhosphorIcons.polygon,
    routeNavigator: 'calculatorFood',
  ),
  ProfileButtonModel(
    nameButton: 'Training',
    iconButton: PhosphorIcons.barbell_bold,
    routeNavigator: 'calculatorFood',
  ),
];
