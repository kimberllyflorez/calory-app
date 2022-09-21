import 'package:calory_tracker/home/ui/widgets/meal_section_wd.dart';
import 'package:flutter/material.dart';

class HomeMealSection extends StatelessWidget {
  final meal = <ListFoodsModel>[
    ListFoodsModel(
      imageMeal: 'assets/breackfast.jpg',
      mealName: 'Breakfast',
    ),
    ListFoodsModel(
      imageMeal: 'assets/ic_dinner.png',
      mealName: 'Lunch',
    ),
    ListFoodsModel(
      imageMeal: 'assets/ic_lunch.png',
      mealName: 'Dinner',
    ),
    ListFoodsModel(
      imageMeal: 'assets/food.png',
      mealName: 'Snack',
    ),
  ]; //

  HomeMealSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return MealSection(
              title: meal[index].mealName,
              index: index, imageMeals: meal[index].imageMeal,
              // selectedValue: selectedValue,
            );
          },
          itemCount: meal.length,
        ),
      ],
    );
  }
}

class ListFoodsModel {
  final String mealName;
  final String imageMeal;

  ListFoodsModel({
    required this.imageMeal,
    required this.mealName,
  });
}
