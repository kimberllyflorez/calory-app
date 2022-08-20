import 'package:calory_tracker/providers/theme_modo_provider.dart';
import 'package:calory_tracker/widgets/backgraoun_image_profil_Widget.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class UserPreferencePage extends StatelessWidget {
  const UserPreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeSelectProvider>().getThemeBool();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackgrounImageProfil(),
            DataProfile(),
            DayNightSwitcher(
              isDarkModeEnabled: theme,
              onStateChanged: (_) => onStateChanged(context, false),
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
          iconName: buttonsProfilList[index].NameButton,
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
            onPressed: () => Navigator.pushNamed(context, route ?? ''),
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
  final String NameButton;
  final IconData iconButton;
  final String? routeNavigator;

  ProfileButtonModel({
    required this.NameButton,
    required this.iconButton,
    this.routeNavigator,
  });
}

final buttonsProfilList = <ProfileButtonModel>[
  ProfileButtonModel(
    NameButton: 'caloric recalculation',
    iconButton: PhosphorIcons.calculator_fill,
  ),
  ProfileButtonModel(
    NameButton: 'About me ',
    iconButton: PhosphorIcons.user_circle_gear_fill,
  ),
  ProfileButtonModel(
    NameButton: 'my calendar',
    iconButton: PhosphorIcons.calendar_check_fill,
  ),
  ProfileButtonModel(
    NameButton: 'supplements',
    iconButton: PhosphorIcons.polygon,
  ),
  ProfileButtonModel(
    NameButton: 'Training',
    iconButton: PhosphorIcons.barbell_bold,
  ),

];
