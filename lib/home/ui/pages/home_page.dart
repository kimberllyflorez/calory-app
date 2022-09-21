import 'package:calory_tracker/calorie_calculator/ui/pages/user_preference_page.dart';
import 'package:calory_tracker/home/ui/widgets/calorie_bar_wd.dart';
import 'package:calory_tracker/home/ui/widgets/home_meal_section_wd.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerWidth = MediaQuery.of(context).size.width * .8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4ECDC4),
        elevation: 0,
      ),
      drawer: Drawer(
        width: drawerWidth,
        child: UserPreferencePage(
          width: drawerWidth,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CalorieBar(),
             _FoodHistory(),
             HomeMealSection(),
          ],
        ),
      ),
    );
  }
}


class _FoodHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(Icons.arrow_back_outlined),
        Text('aqui va el dia'),
        Icon(Icons.arrow_forward_outlined),
      ],
    );
  }
}
