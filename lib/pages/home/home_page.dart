import 'package:calory_tracker/pages/user_preference_page/user_preference_page.dart';
import 'package:calory_tracker/widgets/ExpandableWidget/list_meals_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/percent_indicator_widget.dart';

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
            const CustomAppBar(),
             _FoodHistory(),
             ListMealsWidget(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4ECDC4),
            Color(0xFF556270),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: const WidgetCustomerAppBar(),
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
