import 'package:calory_tracker/providers/products_provider.dart';
import 'package:calory_tracker/theme/app_theme.dart';
import 'package:calory_tracker/widgets/ExpandableWidget/expandable_ListFoods_Widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ListMealswidget extends StatelessWidget {
  final List<String> meal = const [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
  ];

  const ListMealswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ExpandableListFoodsWidget(
              title: meal[index],
              index: index,
            );
          },
          itemCount: meal.length,
        ),
      ],
    );
  }
}
